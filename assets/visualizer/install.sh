#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.config/Light/assets/settings"

mkdir -p "$DEST"

install -m 644 "$DIR/elyfly.png" "$DEST/elyfly.png"
install -m 644 "$DIR/elyhoc.png" "$DEST/elyhoc.png"

echo "LightOS visualizer artwork installed."
