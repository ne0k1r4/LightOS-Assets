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

# LIGHTOS_CLOCK_ASSETS
CLOCK_SOURCE="$ROOT/assets/clocks/clock"
CLOCK_DEST="${XDG_DATA_HOME:-$HOME/.local/share}/lightos-clock/assets"

if [[ ! -d "$CLOCK_SOURCE" ]]; then
    echo "Missing LightOS clock artwork: $CLOCK_SOURCE" >&2
    exit 1
fi

mkdir -p "$CLOCK_DEST"
cp -a "$CLOCK_SOURCE/." "$CLOCK_DEST/"
printf 'Installed LightOS clock artwork to %s\n' "$CLOCK_DEST"

# LIGHTOS_SWAYNC_DEATHNOTE_ASSETS
SWAYNC_SOURCE="$ROOT/assets/swaync/deathnote"
SWAYNC_DEST="${XDG_CONFIG_HOME:-$HOME/.config}/swaync/themes/lightos-gothic"
if [[ ! -d "$SWAYNC_SOURCE" ]]; then
    echo "Missing SwayNC artwork: $SWAYNC_SOURCE" >&2
    exit 1
fi
mkdir -p "$SWAYNC_DEST"
install -m644 "$SWAYNC_SOURCE/notification-center.png" "$SWAYNC_DEST/swaync-panel-380.png"
install -m644 "$SWAYNC_SOURCE/notification-card.png" "$SWAYNC_DEST/notification-card-400.png"
install -m644 "$SWAYNC_SOURCE/clear-button.png" "$SWAYNC_DEST/clear-button.png"
install -m644 "$SWAYNC_SOURCE/close-button.png" "$SWAYNC_DEST/close-button.png"
# END_LIGHTOS_SWAYNC_DEATHNOTE_ASSETS
