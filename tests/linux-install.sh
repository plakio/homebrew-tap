#!/usr/bin/env bash
# Run as the Homebrew owner in a disposable Ubuntu container, initially without
# developer tools. This test does not install privileged system packages.
set -euo pipefail
mode="${1:-}"
export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_ANALYTICS=1
case "$mode" in
    missing-tools)
        if command -v gcc >/dev/null || command -v make >/dev/null; then
            echo 'Expected a clean environment without gcc/make.' >&2; exit 1
        fi
        log=$(mktemp)
        trap 'rm -f "$log"' EXIT
        if brew install plakio/tap/plak-cli > "$log" 2>&1; then
            echo 'Expected Homebrew source-install prerequisite failure.' >&2; exit 1
        fi
        cat "$log"
        grep -q 'No developer tools installed' "$log"
        ;;
    installed-tools)
        command -v gcc
        command -v make
        brew install plakio/tap/plak-cli
        brew test plakio/tap/plak-cli
        plak version | grep -E '^plak v[0-9]+\.[0-9]+\.[0-9]+$'
        ;;
    *) echo "Usage: $0 missing-tools|installed-tools" >&2; exit 1 ;;
esac
