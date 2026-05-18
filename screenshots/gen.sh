#!/usr/bin/env sh
#
# gen.sh — regenerate the animated README demo for atlas-ragnarok.
#
# Requirements (install once):
#   brew install vhs ffmpeg webp bat tree
#
# Run from the repo root:
#   sh screenshots/gen.sh
#
# Produces:
#   screenshots/02-demo.webp — animated, embedded in the README via <img>
#                              (renders inline on github.com, plays in
#                              every modern browser including Safari)
#   screenshots/02-demo.mp4  — same animation as MP4, kept as a
#                              supplementary download link in the README
#
# The static hero (`01-hero-vignette.png`) is hand-captured from the
# author's actual Ghostty terminal so the shader vignette is visible.
# vhs/ttyd can't replicate that shader, so we leave the hero alone.

set -eu

cd "$(dirname "$0")/.."   # repo root
HERE="screenshots"

command -v vhs      >/dev/null 2>&1 || { echo "vhs not installed (brew install vhs)" >&2; exit 1; }
command -v ffmpeg   >/dev/null 2>&1 || { echo "ffmpeg not installed (brew install ffmpeg)" >&2; exit 1; }
command -v gif2webp >/dev/null 2>&1 || { echo "gif2webp not installed (brew install webp)" >&2; exit 1; }
command -v bat      >/dev/null 2>&1 || echo "warning: bat not installed — Scene 1 will fall back to cat -n (less colorful)" >&2

echo "→ raw GIF (vhs, atlas-ragnarok theme)"
vhs "${HERE}/demo.tape"

echo "→ 02-demo.webp (animated, README embed)"
# WebP renders as <img>, which GitHub's README sanitizer leaves alone.
# Modern Safari plays it; smaller than the source GIF.
gif2webp -quiet -q 80 -m 6 -mt -mixed \
  "${HERE}/_demo_raw.gif" \
  -o "${HERE}/02-demo.webp"

echo "→ 02-demo.mp4 (kept as a supplementary download)"
ffmpeg -hide_banner -loglevel error -y \
  -i "${HERE}/_demo_raw.gif" \
  -movflags +faststart \
  -pix_fmt yuv420p \
  -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
  -c:v libx264 -preset slow -crf 22 \
  "${HERE}/02-demo.mp4"

# The raw GIF is an intermediate artifact — drop it.
rm -f "${HERE}/_demo_raw.gif"

echo "done."
echo "  01-hero-vignette.png $(du -h ${HERE}/01-hero-vignette.png | cut -f1)  (unchanged, hand-captured)"
echo "  02-demo.webp         $(du -h ${HERE}/02-demo.webp        | cut -f1)  ← embedded in README"
echo "  02-demo.mp4          $(du -h ${HERE}/02-demo.mp4         | cut -f1)"
