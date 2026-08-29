#!/usr/bin/env bash

# Generic Homebrew formula updater for the plakio/tap repository.
# Generates Formula/<name>.rb from templates/<name>.rb.template, downloading
# the upstream archive to compute its sha256.
#
# Usage: scripts/update-formula.sh <formula> <version>
#
# Supported formulas (whitelist):
#   plak-cli      plakio/plak-cli
#   wp-mcp-cli    plakio/wp-mcp-cli
#
# Adding a new formula:
#   1. Drop a templates/<formula>.rb.template file with __VERSION__ and __SHA256__ placeholders.
#   2. Add the formula + repo name to the case statement below.
#   3. Tag a release in the repo with notify-homebrew-tap.yml sending formula: "<formula>".

set -euo pipefail

formula="${1:-}"
version="${2:-}"

if [ -z "$formula" ] || [ -z "$version" ]; then
    echo "Usage: $0 <formula> <version>" >&2
    exit 1
fi

version="${version#v}"
if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid version: $version (expected X.Y.Z)" >&2
    exit 1
fi

# Whitelist: map formula name → source repo.
repo=""
case "$formula" in
    plak-cli)    repo="plak-cli" ;;
    wp-mcp-cli)  repo="wp-mcp-cli" ;;
    *)
        echo "Unknown formula: $formula" >&2
        echo "Add it to the case statement in scripts/update-formula.sh first." >&2
        exit 1
        ;;
esac

for command in curl shasum sed; do
    command -v "$command" >/dev/null 2>&1 || {
        echo "$command is required." >&2
        exit 1
    }
done

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
repo_root=$(cd "$script_dir/.." && pwd)
template="$repo_root/templates/${formula}.rb.template"
formula_file="$repo_root/Formula/${formula}.rb"
archive_url="https://github.com/plakio/${repo}/archive/refs/tags/v${version}.tar.gz"

if [ ! -f "$template" ]; then
    echo "Template not found: $template" >&2
    exit 1
fi

archive=$(mktemp)
generated=$(mktemp)
trap 'rm -f "$archive" "$generated"' EXIT

curl --retry 5 --retry-all-errors -fsSL "$archive_url" -o "$archive"
sha256=$(shasum -a 256 "$archive" | cut -d ' ' -f 1)

sed \
    -e "s/__VERSION__/${version}/g" \
    -e "s/__SHA256__/${sha256}/g" \
    "$template" > "$generated"

mv "$generated" "$formula_file"
echo "Updated Formula/${formula}.rb to ${version} (sha256=${sha256})"
