# Claude

## Claude Code (CLI)

Anthropic's official CLI agent for coding tasks.

### Installation

```bash
npm install -g @anthropic-ai/claude-code
```

### Usage

```bash
claude
```

### Skip Permissions Prompt

To run Claude Code without interactive permission prompts (useful for automation and CI/CD):

```bash
claude --dangerously-skip-permissions
```

!!! warning
    This flag skips all permission checks — Claude will execute file edits, shell commands, and other actions without asking for confirmation. Only use in trusted environments.
