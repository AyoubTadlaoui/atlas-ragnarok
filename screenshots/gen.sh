#!/usr/bin/env sh
#
# gen.sh — regenerate the animated README demo for atlas-ragnarok.
#
# Requirements (install once):
#   brew install vhs ffmpeg webp bat tree
#   pip3 install --user --break-system-packages pillow numpy
#
# Run from the repo root:
#   sh screenshots/gen.sh
#
# Produces:
#   screenshots/02-demo.webp — animated, GLSL shader applied per pixel
#                              (including the luminance mask) so text
#                              stays crisp under the storm-fire vignette.
#   screenshots/02-demo.mp4  — same animation as MP4, supplementary download.
#
# The static hero (`01-hero-vignette.png`) is hand-captured from a real
# Ghostty session — leave it alone; the live GPU shader is the source.

set -eu

cd "$(dirname "$0")/.."   # repo root
HERE="screenshots"

command -v vhs      >/dev/null 2>&1 || { echo "vhs not installed (brew install vhs)" >&2; exit 1; }
command -v ffmpeg   >/dev/null 2>&1 || { echo "ffmpeg not installed (brew install ffmpeg)" >&2; exit 1; }
command -v gif2webp >/dev/null 2>&1 || { echo "gif2webp not installed (brew install webp)" >&2; exit 1; }
command -v python3  >/dev/null 2>&1 || { echo "python3 not installed" >&2; exit 1; }
python3 -c "import numpy, PIL" 2>/dev/null \
  || { echo "missing python deps (pip3 install --user --break-system-packages pillow numpy)" >&2; exit 1; }
command -v bat      >/dev/null 2>&1 || echo "warning: bat not installed — Scene 1 will fall back to cat -n (less colorful)" >&2

echo "→ raw GIF (vhs, atlas-ragnarok base palette)"
vhs "${HERE}/demo.tape"

echo "→ apply GLSL shader per pixel (luma mask keeps text crisp)"
rm -rf "${HERE}/_frames"
python3 "${HERE}/_shader.py" "${HERE}/_demo_raw.gif" "${HERE}/_frames"

# PIL reports per-frame duration in milliseconds. Average → fps for ffmpeg.
AVG_MS=$(awk '{s+=$1; n++} END {printf "%d", (s/n) + 0.5}' "${HERE}/_frames/duration.txt")
FPS=$(awk -v ms="$AVG_MS" 'BEGIN {if (ms <= 0) ms = 100; printf "%g", 1000.0 / ms}')
echo "    avg frame delay ${AVG_MS}ms (${FPS} fps)"

echo "→ reassemble shaded GIF (ffmpeg palettegen for cross-frame delta compression)"
ffmpeg -hide_banner -loglevel error -y \
  -framerate "$FPS" -i "${HERE}/_frames/frame_%05d.png" \
  -filter_complex "split[s0][s1];[s0]palettegen=stats_mode=full[p];[s1][p]paletteuse=dither=bayer:bayer_scale=5" \
  -loop 0 \
  "${HERE}/_demo_shaded.gif"

echo "→ 02-demo.webp (animated WebP, README embed)"
gif2webp -quiet -q 80 -m 6 -mt -mixed \
  "${HERE}/_demo_shaded.gif" \
  -o "${HERE}/02-demo.webp"

echo "→ 02-demo.mp4 (supplementary download)"
ffmpeg -hide_banner -loglevel error -y \
  -framerate "$FPS" -i "${HERE}/_frames/frame_%05d.png" \
  -movflags +faststart \
  -pix_fmt yuv420p \
  -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
  -c:v libx264 -preset slow -crf 22 \
  "${HERE}/02-demo.mp4"

# Drop intermediates.
rm -rf "${HERE}/_frames"
rm -f "${HERE}/_demo_raw.gif" "${HERE}/_demo_shaded.gif"

echo "done."
echo "  01-hero-vignette.png $(du -h ${HERE}/01-hero-vignette.png | cut -f1)  (unchanged, live GPU shader)"
echo "  02-demo.webp         $(du -h ${HERE}/02-demo.webp        | cut -f1)  ← embedded in README"
echo "  02-demo.mp4          $(du -h ${HERE}/02-demo.mp4         | cut -f1)"
