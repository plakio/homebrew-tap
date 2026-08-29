# Homebrew Tap for Plak

Official Homebrew formulas for the Plak ecosystem.

## Available Formulae

- `plak-cli` — Plak CLI is the simplest way to run local WordPress sites and deploy them to any cloud — instant environments, built-in HTTPS, and seamless workflows from your terminal.
- `wp-mcp-cli` — Bash + gum CLI for the [WP-MCP WordPress plugin](https://github.com/plakio/wp-mcp). Discovers, describes, and executes abilities over REST + HTTP Basic.

## Installation

Install directly:

```bash
brew install plakio/tap/<formula>
```

Or tap the repository first:

```bash
brew tap plakio/tap
brew install <formula>
```

## Adding a New Formula

1. Drop a template at `templates/<formula>.rb.template` with `__VERSION__` and `__SHA256__` placeholders.
2. Add the formula + repo name to the whitelist case statement in `scripts/update-formula.sh`.
3. Push a tag in the source repo with `notify-homebrew-tap.yml` sending `formula: "<formula>"` in `client_payload`.

The `update-formula` workflow in `.github/workflows/update-formula.yml` handles all dispatches and keeps the formula in sync.
