#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DEST="${XDG_DATA_HOME:-$HOME/.local/share}/icons/LightOS"
mkdir -p "$DEST"
cp -a "$ROOT/icons/LightOS/." "$DEST/"
if command -v gtk-update-icon-cache >/dev/null; then
    gtk-update-icon-cache -f "$DEST" >/dev/null 2>&1 || true
fi
printf 'Installed the LightOS icon theme to %s\n' "$DEST"
