# Homebrew Tap for Plak

Official Homebrew formulas for the Plak ecosystem.

## Available Formulae

- `plak-cli` — Plak CLI is the simplest way to run local WordPress sites and deploy them to any cloud — instant environments, built-in HTTPS, and seamless workflows from your terminal.
- `wp-mcp-cli` — Bash + gum CLI for the [WP-MCP WordPress plugin](https://github.com/plakio/wp-mcp). Discovers, describes, and executes abilities over REST + HTTP Basic.

## Installation

### Linux and Ubuntu WSL2 prerequisites

Use Homebrew inside WSL2, not a native Windows shell. Follow Homebrew's
[Linux requirements](https://docs.brew.sh/Homebrew-on-Linux#requirements) and
use its supported `/home/linuxbrew/.linuxbrew` prefix for available bottles.
On Ubuntu/Debian, run these commands **yourself** if the packages are missing:

```bash
sudo apt-get update
sudo apt-get install build-essential procps curl file git
```

If Homebrew already works except for `No developer tools installed`, the missing
package is normally `build-essential`. It supplies GCC, make and development
headers. On Fedora use `sudo dnf group install development-tools`; on RHEL/CentOS
Stream use `sudo dnf group install 'Development Tools'`, plus
`sudo dnf install procps-ng curl file git`. Arch uses
`sudo pacman -S base-devel procps-ng curl file git`.

Plak itself is Bash: `compile.sh` concatenates modules and does not compile C or
Go. However, this tap currently has **no Plak bottle**, so Homebrew runs its
mandatory source-install developer-tools checks before the formula's install
method. A gum bottle does not remove that requirement. Do not use
`--build-from-source` unnecessarily: other dependencies can use bottles on
supported platforms/prefixes. Do not bypass Homebrew's checks or add compiler
dependencies to the formula to conceal missing host prerequisites.

The [direct CLI installer](https://github.com/plakio/plak-cli#installation)
does not require a compiler to copy the Bash CLI; installing local stack
dependencies afterward has separate requirements. No Plak installer silently
installs the system packages listed above. Bottles would require an additional
build/distribution pipeline; they are not published by this change.

The clean Ubuntu CI test below checks the missing-tools failure and successful
installation after explicit prerequisites. It is **not** a real WSL2 test;
Windows integration must still be accepted manually.

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
