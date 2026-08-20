#!/usr/bin/env bash

set -euo pipefail

version="${1:-}"
if [ -z "$version" ]; then
    echo "Usage: $0 <version>" >&2
    exit 1
fi

version="${version#v}"
if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid version: $version (expected X.Y.Z)" >&2
    exit 1
fi

for command in curl shasum sed; do
    command -v "$command" >/dev/null 2>&1 || {
        echo "$command is required." >&2
        exit 1
    }
done

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
repo_root=$(cd "$script_dir/.." && pwd)
template="$repo_root/templates/plak-cli.rb.template"
formula="$repo_root/Formula/plak-cli.rb"
archive_url="https://github.com/plakio/plak-cli/archive/refs/tags/v${version}.tar.gz"
archive=$(mktemp)
generated=$(mktemp)
trap 'rm -f "$archive" "$generated"' EXIT

curl --retry 5 --retry-all-errors -fsSL "$archive_url" -o "$archive"
sha256=$(shasum -a 256 "$archive" | cut -d ' ' -f 1)

sed \
    -e "s/__VERSION__/${version}/g" \
    -e "s/__SHA256__/${sha256}/g" \
    "$template" > "$generated"

mv "$generated" "$formula"
echo "Updated Formula/plak-cli.rb to $version"
