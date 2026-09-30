# LightOS Assets

Original, source-editable LightOS SVG icons. The artwork in this repository is drawn from simple vector geometry and does not require external image files or icon packages.

## Install the icon theme

```sh
./install.sh
```

The theme is installed for the current user under `~/.local/share/icons/LightOS`. Select **LightOS** in the desktop's icon-theme settings. The icons are scalable SVGs and can be rendered by GTK at different sizes. The visualizer background is installed to `~/.config/Light/assets/settings/` for the LightOS Widgets visualizers.

## Contents

- `icons/LightOS/scalable/apps/` — LightOS application icons.
- `icons/LightOS/scalable/mimetypes/` — text, code, archive, and office file icons.
- Audio MIME icons use the same `audio-headphones.png` artwork as the Waybar volume indicator.
- `icons/LightOS/scalable/status/` — battery, Wi-Fi, Bluetooth, and temperature symbols.
- `tools/generate-icons.py` — regenerates the checked-in SVG icon files.
- `bash/` — 29 PNG banner images displayed at terminal startup by `light-banner.sh`.
- `wallpaper/Dark/` — Dark theme wallpapers (images + videos) installed to `~/.config/Light/wallpaper/Dark/`.
- `wallpaper/Light/` — Light theme wallpapers (images + videos) installed to `~/.config/Light/wallpaper/Light/`.

The SVGs are new LightOS artwork. No downloaded raster sheets or third-party theme sources are needed.

## Wallpaper library

`wallpaper/Dark/` contains:
- Images: `2.png`, `44.png`, `5.png`, `cc.png`, `ss.png`, `death-note-manga-panel.png`,
  `enchanted-garden.png`, `misa-amane-dark-angel.jpg`, `misa-amane-dark-kawaii.png`,
  `misa-amane-monochrome.png`, `misa-amane-portrait.jpg`, `misa-amane-poster.png`,
  `misa-amane-red-banner.png`, `misa-amane-roses.jpg`, `neon-city.png`
- Videos: `blue-city-at-night.mp4`, `death-note-eye-loop.mp4`, `monochrome-rain.mp4`,
  `night-lake-stars.mp4`, `winged-altar.mp4`

`wallpaper/Light/` contains:
- Images: `2.png`, `5.png`, `death-note-manga-panel.png`, `enchanted-garden.png`,
  `misa-amane-pink-desktop.jpg`, `misa-amane-portrait.jpg`, `misa-amane-poster.png`,
  `misa-amane-red-banner.png`, `misa-amane-roses.jpg`, `misa-amane-soft-pink.jpg`,
  `neon-city.png`, `silver-angel.jpg`, `silver-angel.png`
- Videos: `22.mp4`, `snow-angel.mp4`

Note: `local-personal-video.mp4` exists only in the live configuration and is never committed.
