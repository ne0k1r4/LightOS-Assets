# LightOS Assets

Gothic anime artwork, icons, wallpapers, and bash banners for the LightOS desktop.

## Install

```sh
git clone https://github.com/ne0k1r4/LightOS-Assets.git
cd LightOS-Assets
./install.sh
```

Installs to the current user — no root required.

## What's installed

| Asset | Destination |
|---|---|
| Icon theme (SVG + PNG) | `~/.local/share/icons/LightOS/` |
| PNG mime icons (16px + 128px) | `~/.icons/LightOS/16/mimetypes/` and `128/mimetypes/` |
| Waybar icons | `~/.config/waybar/icons/` and `Dark/icons/` |
| Settings background | `~/.config/Light/assets/settings/` |
| Wallpapers (Dark + Light) | `~/.config/Light/wallpaper/` |
| Bash banner images | `~/.config/Light/bash/` |

After install, select **LightOS** in your icon theme settings or run:
```sh
gtk-update-icon-cache -f -t ~/.icons/LightOS
```

## Contents

- `icons/LightOS/scalable/` — SVG app, mime, and status icons
- `icons/LightOS/16/mimetypes/` — 100+ gothic anime PNG mime icons (128×128px)
- `icons/LightOS/128/mimetypes/` — same set at full size
- `assets/waybar/icons/` — Waybar panel icons
- `assets/settings/` — Settings app background artwork
- `wallpaper/Dark/` — Dark theme wallpapers (images + videos)
- `wallpaper/Light/` — Light theme wallpapers (images + videos)
- `bash/` — 29 gothic anime PNG images for terminal startup banner

## License

MIT — see [LICENSE](LICENSE).
