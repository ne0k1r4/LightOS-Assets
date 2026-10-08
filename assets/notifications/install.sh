#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.local/share/lightos-notifications"

mkdir -p "$DEST"

install -m 644 "$ROOT/kuru-kuru.wav" "$DEST/chime.wav"

echo "LightOS Kuru Kuru notification sound installed."
