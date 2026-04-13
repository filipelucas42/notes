# Openclaw

- Build common image for sandbox: `./scripts/sandbox-browser-setup.sh`
- Recreate sandbox agent: `openclaw sandbox recreate --agent <agent_name>`
- Force recreat sandbox agent (useful to load env vars): `openclaw sandbox recreate --agent <agent_name> --force`
- Give access to network request in sandbox:
```
"docker": {
  "network": "bridge",
  "dns": ["1.1.1.1", "8.8.8.8"]
}
```

## Define env vars for host agents:

Create/edit:
~/.config/systemd/user/openclaw-gateway.service.d/override.conf

Example:

[Service]
Environment="MY_VAR=value"
Environment="ANOTHER_VAR=value2"

Then reload and restart:

systemctl --user daemon-reload
systemctl --user restart openclaw-gateway