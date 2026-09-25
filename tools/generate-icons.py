#!/usr/bin/env python3
"""Generate the original LightOS SVG icon set."""

from html import escape
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parents[1]
ICON_ROOT = ROOT / "icons/LightOS/scalable"
BLUE = "#4f7ff0"
CYAN = "#49c5d9"
VIOLET = "#9271ed"
GREEN = "#48b889"
AMBER = "#e8ae45"
RED = "#e56875"
INK = "#172033"
PAPER = "#f4f6fb"


def save(relative: str, content: str) -> None:
    path = ICON_ROOT / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content.strip() + "\n", encoding="utf-8")


def document(label: str, color: str) -> str:
    label = escape(label)
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <path d="M15 5h23l13 13v39a3 3 0 0 1-3 3H15a4 4 0 0 1-4-4V9a4 4 0 0 1 4-4Z" fill="{PAPER}" stroke="{INK}" stroke-width="3" stroke-linejoin="round"/>
  <path d="M38 5v13h13" fill="none" stroke="{INK}" stroke-width="3" stroke-linejoin="round"/>
  <path d="M19 27h23M19 34h18" stroke="#b8c1d2" stroke-width="3" stroke-linecap="round"/>
  <rect x="17" y="39" width="30" height="14" rx="5" fill="{color}"/>
  <text x="32" y="49.5" text-anchor="middle" font-family="sans-serif" font-size="9" font-weight="700" fill="#fff">{label}</text>
</svg>'''


def app_mark(label: str, color: str, glyph: str) -> str:
    glyph = escape(glyph)
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <rect x="5" y="5" width="54" height="54" rx="16" fill="{color}"/>
  <path d="M20 18h24a5 5 0 0 1 5 5v20a5 5 0 0 1-5 5H20a5 5 0 0 1-5-5V23a5 5 0 0 1 5-5Z" fill="#fff" fill-opacity=".95"/>
  <text x="32" y="39" text-anchor="middle" font-family="sans-serif" font-size="17" font-weight="700" fill="{INK}">{glyph}</text>
  <circle cx="48" cy="16" r="4" fill="{CYAN}"/>
</svg>'''


def status_icon(name: str) -> str:
    if name == "battery":
        shape = '<rect x="9" y="20" width="42" height="25" rx="5"/><path d="M54 27h4v11h-4"/><path d="M16 27h24v11H16z" fill="#49c5d9" stroke="none"/>'
    elif name == "network-wireless":
        shape = '<path d="M7 24c14-13 36-13 50 0M15 33c10-9 24-9 34 0M23 42c5-5 13-5 18 0"/><circle cx="32" cy="51" r="3" fill="#49c5d9" stroke="none"/>'
    elif name == "bluetooth":
        shape = '<path d="M31 7v50l17-15-31-25M17 47 48 18 31 7"/>'
    else:
        shape = '<path d="M27 10a5 5 0 0 1 10 0v25a10 10 0 1 1-10 0Z"/><path d="M32 22v22" stroke="#49c5d9" stroke-width="5" stroke-linecap="round"/><path d="M37 42h7"/>'
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <g fill="none" stroke="{INK}" stroke-width="4" stroke-linecap="round" stroke-linejoin="round">{shape}</g>
</svg>'''


def main() -> None:
    apps = {
        "lightos": (BLUE, "L"),
        "lightos-downloader": (CYAN, "DL"),
        "system-settings": (VIOLET, "CFG"),
        "system-file-manager": (GREEN, "FM"),
        "utilities-terminal": (INK, ">_"),
    }
    for name, (color, glyph) in apps.items():
        save(f"apps/{name}.svg", app_mark(name, color, glyph))

    mime_icons = {
        "application-zip": ("ZIP", BLUE),
        "application-x-zip-compressed": ("ZIP", BLUE),
        "application-vnd.rar": ("RAR", VIOLET),
        "application-x-rar-compressed": ("RAR", VIOLET),
        "application-gzip": ("GZ", AMBER),
        "application-pdf": ("PDF", RED),
        "application-msword": ("DOC", BLUE),
        "application-vnd.openxmlformats-officedocument.wordprocessingml.document": ("DOCX", BLUE),
        "x-office-document": ("DOC", BLUE),
        "x-office-presentation": ("PPT", RED),
        "application-vnd.openxmlformats-officedocument.presentationml.presentation": ("PPTX", RED),
        "x-office-spreadsheet": ("XLS", GREEN),
        "application-vnd.openxmlformats-officedocument.spreadsheetml.sheet": ("XLSX", GREEN),
        "text-plain": ("TXT", INK),
        "text-x-plain": ("TXT", INK),
        "text-x-generic": ("TXT", INK),
        "text-x-c": ("C", CYAN),
        "text-x-csrc": ("C", CYAN),
        "text-x-chdr": ("H", CYAN),
        "text-x-c++": ("C++", VIOLET),
        "text-x-c++src": ("C++", VIOLET),
        "application-javascript": ("JS", AMBER),
        "text-x-javascript": ("JS", AMBER),
        "text-x-typescript": ("TS", BLUE),
        "text-x-python": ("PY", BLUE),
        "text-x-lua": ("LUA", VIOLET),
        "application-json": ("JSON", GREEN),
        "application-jsonc": ("JSON", GREEN),
        "text-x-jsonc": ("JSON", GREEN),
        "text-x-toml": ("TOML", AMBER),
        "application-yaml": ("YAML", RED),
        "text-x-yaml": ("YAML", RED),
        "application-x-executable": ("EXE", INK),
        "application-x-shellscript": ("SH", INK),
        "text-x-script": ("SH", INK),
    }
    for name, (label, color) in mime_icons.items():
        save(f"mimetypes/{name}.svg", document(label, color))

    for name in ("battery", "network-wireless", "bluetooth", "temperature"):
        save(f"status/{name}.svg", status_icon(name))

    # Keep audio MIME icons consistent with the headphones artwork used by
    # Waybar. The raster source is preserved at its native 128x128 size; the
    # icon theme scales it for other requested sizes.
    audio_source = ROOT / "assets/audio-headphones.png"
    audio_default = ICON_ROOT / "mimetypes/audio-x-generic.png"
    audio_default.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(audio_source, audio_default)
    audio_aliases = (
        "audio-mp3",
        "audio-midi",
        "audio-aac",
        "audio-mpeg",
        "audio-ogg",
        "audio-flac",
        "audio-wav",
        "audio-x-aac",
        "audio-x-aiff",
        "audio-x-m4a",
        "audio-x-mpeg",
        "audio-x-ms-wma",
        "audio-x-opus",
        "audio-x-vorbis",
        "audio-x-wav",
    )
    for name in audio_aliases:
        alias = audio_default.parent / f"{name}.png"
        alias.unlink(missing_ok=True)
        alias.symlink_to(audio_default.name)


if __name__ == "__main__":
    main()
