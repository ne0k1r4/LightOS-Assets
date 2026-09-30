#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DEST="${XDG_DATA_HOME:-$HOME/.local/share}/icons/LightOS"
mkdir -p "$DEST"
cp -a "$ROOT/icons/LightOS/." "$DEST/"

CONFIG_DEST="${XDG_CONFIG_HOME:-$HOME/.config}/Light/assets/settings"
mkdir -p "$CONFIG_DEST"
install -m 644 "$ROOT/assets/settings/background-mem.png" "$CONFIG_DEST/background-mem.png"

WALLPAPER_DEST="${XDG_CONFIG_HOME:-$HOME/.config}/Light/wallpaper"
if [[ -d "$ROOT/wallpaper" ]]; then
    mkdir -p "$WALLPAPER_DEST"
    cp -an "$ROOT/wallpaper/." "$WALLPAPER_DEST/"
fi

BASH_DEST="${XDG_CONFIG_HOME:-$HOME/.config}/Light/bash"
if [[ -d "$ROOT/bash" ]]; then
    mkdir -p "$BASH_DEST"
    cp -an "$ROOT/bash/." "$BASH_DEST/"
fi

WAYBAR_ICONS_DEST="${XDG_CONFIG_HOME:-$HOME/.config}/waybar/icons"
WAYBAR_DARK_ICONS_DEST="${XDG_CONFIG_HOME:-$HOME/.config}/waybar/Dark/icons"
if [[ -d "$ROOT/assets/waybar/icons" ]]; then
    mkdir -p "$WAYBAR_ICONS_DEST"
    cp -an "$ROOT/assets/waybar/icons/." "$WAYBAR_ICONS_DEST/"
fi
if [[ -d "$ROOT/assets/waybar/Dark/icons" ]]; then
    mkdir -p "$WAYBAR_DARK_ICONS_DEST"
    cp -an "$ROOT/assets/waybar/Dark/icons/." "$WAYBAR_DARK_ICONS_DEST/"
fi

if command -v gtk-update-icon-cache >/dev/null; then
    gtk-update-icon-cache -f "$DEST" >/dev/null 2>&1 || true
fi
printf 'Installed the LightOS icon theme to %s\n' "$DEST"
