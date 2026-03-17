#!/bin/bash
set -euo pipefail

FORMULA="Formula/protokol-cli.rb"
URL="https://github.com/laibulle/protokol/archive/refs/heads/main.tar.gz"

echo "Downloading tarball from main branch..."
NEW_SHA=$(curl -sL "$URL" | shasum -a 256 | awk '{print $1}')

echo "New SHA256: $NEW_SHA"

sed -i '' "s/sha256 \"[a-f0-9]\{64\}\"/sha256 \"$NEW_SHA\"/" "$FORMULA"

echo "Updated $FORMULA"
