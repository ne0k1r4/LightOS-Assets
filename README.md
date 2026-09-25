# LightOS Assets

Original, source-editable LightOS SVG icons. The artwork in this repository is drawn from simple vector geometry and does not require external image files or icon packages.

## Install the icon theme

```sh
./install.sh
```

The theme is installed for the current user under `~/.local/share/icons/LightOS`. Select **LightOS** in the desktop's icon-theme settings. The icons are scalable SVGs and can be rendered by GTK at different sizes.

## Contents

- `icons/LightOS/scalable/apps/` — LightOS application icons.
- `icons/LightOS/scalable/mimetypes/` — text, code, archive, and office file icons.
- Audio MIME icons use the same `audio-headphones.png` artwork as the Waybar volume indicator.
- `icons/LightOS/scalable/status/` — battery, Wi-Fi, Bluetooth, and temperature symbols.
- `tools/generate-icons.py` — regenerates the checked-in SVG icon files.

The SVGs are new LightOS artwork. No downloaded raster sheets or third-party theme sources are needed.
