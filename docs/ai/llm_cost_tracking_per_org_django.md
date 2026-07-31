# Per-Organization LLM Cost Tracking (Django Multi-Tenant SaaS)

Design for tracking LLM API expense per organization when all tenants share one Anthropic API key. Context: techland-app-style multi-tenant Django (orgs isolated via context vars + `OrgManager`).

**Core idea:** every API response reports exactly what it consumed; record that per call in an append-only ledger with an org FK, and cost becomes an aggregation query.

---

## 1. What the API gives you

Every Claude Messages API response carries a `usage` object:

```python
response.usage.input_tokens                  # uncached input, full price
response.usage.output_tokens                 # output, full price
response.usage.cache_creation_input_tokens   # cache writes (~1.25x input price, 2x for 1h TTL)
response.usage.cache_read_input_tokens       # cache reads (~0.1x input price)
```

Gotchas:

- `input_tokens` is **only the uncached remainder**. Total prompt = sum of all three input fields. Billing on `input_tokens` alone undercounts whenever prompt caching works.
- Pricing is **per model** (Opus 4.8: $5/$25 per MTok in/out; Sonnet 5: $3/$15; Haiku 4.5: $1/$5; batch = 50% off), so record the model per call, not just tokens.
- Streaming: same usage object on `stream.get_final_message().usage`.

## 2. Usage ledger (one row per call)

```python
class LlmUsage(OrgModelBase):
    org = models.ForeignKey("portal.Org", on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)

    model = models.CharField(max_length=64)          # "claude-opus-4-8"
    feature = models.CharField(max_length=64)        # "tms-summarize", "classify", ...
    request_id = models.CharField(max_length=64)     # response._request_id, for reconciliation
    price = models.ForeignKey("ModelPrice", on_delete=models.PROTECT)

    input_tokens = models.IntegerField()
    output_tokens = models.IntegerField()
    cache_write_tokens = models.IntegerField(default=0)
    cache_read_tokens = models.IntegerField(default=0)

    cost_usd = models.DecimalField(max_digits=10, decimal_places=6)  # snapshot at call time
```

Design decisions:

- **Store raw tokens AND a cost snapshot.** Tokens = immutable ground truth; snapshot keeps historical invoices stable when prices change.
- **Tag a `feature`** per call - "org X spent 380 on classification, 20 on summaries" beats a single total for deciding what to optimize/gate.
- **Keep `request_id`** to reconcile against the Anthropic Console cost report (billing ground truth) monthly.
- Every LLM call goes through **one wrapper function** (`record_usage(response, feature=...)`) that reads `current_org` from the context var. For Celery tasks, pass the org id explicitly - the middleware context var isn't set there.

## 3. Versioned pricing (prices change for the same model)

Real scenario: Sonnet 5 intro price $2/$10 reverts to $3/$15 after 2026-08-31. Don't hardcode a dict - use an append-only rate card:

```python
class ModelPrice(models.Model):
    model = models.CharField(max_length=64)
    effective_from = models.DateTimeField()
    input_usd_per_mtok = models.DecimalField(max_digits=10, decimal_places=4)
    output_usd_per_mtok = models.DecimalField(max_digits=10, decimal_places=4)
    cache_write_multiplier = ...  # default 1.25
    cache_read_multiplier = ...   # default 0.1

    class Meta:
        unique_together = [("model", "effective_from")]
```

- **No `effective_to`** - a new row supersedes the old one. A price change is an *insert, never an update*.
- Lookup = latest row where `effective_from <= call time`:

```python
ModelPrice.objects.filter(model=m, effective_from__lte=at).order_by("-effective_from").first()
```

- **Cache the lookup** (lru_cache with short TTL) - prices change a few times a year, no need for a query per call.
- Future-dated rows work: insert the intro-price expiry today with `effective_from = 2026-09-01` and the switch happens automatically.
- Anthropic does NOT push price changes via API - you learn from the pricing page and insert rows manually. If ledger drifts from the invoice, a missed price change is the first suspect.

Cost formula at write time:

```python
cost = (
    input_tokens * inp
    + cache_write_tokens * inp * Decimal("1.25")
    + cache_read_tokens * inp * Decimal("0.1")
    + output_tokens * out
) / 1_000_000
```

## 4. Division of responsibility

| Piece | Role |
| --- | --- |
| Tokens on `LlmUsage` | Immutable facts from the API |
| `ModelPrice` rows | Append-only rate card; FK on each usage row = full audit trail |
| `cost_usd` snapshot | Derived at write time; stable invoices, cheap aggregation; always recomputable from tokens x price |

## 5. Reporting and limits

- Per-org monthly spend: `LlmUsage.objects.values("org").annotate(Sum("cost_usd"))` filtered by month. Plain aggregation is fine for a long time; add a nightly Celery rollup table only when the ledger gets big.
- Quotas: check org month-to-date sum before calling; refuse or degrade (drop to Haiku) past threshold. Cheap with an index on `(org, created_at)`.
- Anthropic Console usage reports are per API key/workspace, **not per tenant** - per-org attribution must happen in your app. Workspace-per-tenant exists but doesn't scale for SaaS.
