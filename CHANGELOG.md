# Changelog

All notable changes to **atlas-ragnarok** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `screenshots/02-demo.webp` — animated WebP showing all four `scripts/demo.sh`
  scenes (shader code under `bat`, `git log --graph`, fake `cargo` build with
  warnings + errors + green tests, tree + palette listing) rendered in the
  atlas-ragnarok palette. Embedded in the README under "The palette in motion".
- `screenshots/02-demo.mp4` — same demo as H.264 MP4, kept as a supplementary
  download link.
- `screenshots/demo.tape` — [vhs](https://github.com/charmbracelet/vhs) script
  that drives `scripts/demo.sh` through `ttyd` with the theme palette + Mac-style
  window chrome + slate-blue margin (for visual contrast against GitHub's dark
  page background).
- `screenshots/gen.sh` — one-shot regeneration of the animated assets:
  `brew install vhs ffmpeg webp bat tree` once, then `sh screenshots/gen.sh`
  on any release. The static `01-hero-vignette.png` is left alone — it's
  hand-captured from a real Ghostty session so the GLSL shader vignette is
  visible (vhs / ttyd can't replicate that).

### Changed

- README "Capturing your own screenshots" section split into two paths
  (static stills via `demo.sh`, animated demo via `gen.sh`), with explicit
  notes on which method shows the shader and which doesn't.

---

## [1.1.0] — 2026-05-17

### Added
- Multi-platform install instructions (macOS, Linux, Windows / WSL2)
- PowerShell one-liner for Windows users without `git`
- One-shot `curl` install for macOS/Linux without `git`
- Shields.io badges in README header (License, Ghostty, CI, release, stars, last commit)
- `scripts/demo.sh` — four-scene screenshot helper
- `scripts/validate.sh` — palette/shader/port validation script
- GitHub Actions CI workflow (`.github/workflows/validate.yml`)
- `CONTRIBUTING.md` and `CODE_OF_CONDUCT.md`
- `SECURITY.md` with private vulnerability-report channel
- GitHub issue templates (bug, palette-port) + PR template
- `.github/FUNDING.yml` placeholder (commented-out)
- `docs/index.html` — static GitHub Pages preview
- Palette ports under `themes/`:
  - `alacritty.toml`
  - `kitty.conf`
  - `wezterm.lua`
  - `iterm2.itermcolors`
  - `windows-terminal.json`
- SPDX license headers on every source file

---

## [1.0.0] — 2026-05-17

### Added
- `atlas-ragnarok.conf` — Ghostty theme
  - Pure black background `#000000`
  - Vesper-derived 5-color syntax palette, with the orange family
    remapped to a Tailwind blue gradient (`blue-600` → `blue-300`)
  - Thunder-blue cursor `#3b82f6`, deep-navy selection `#1e3a5f`
  - Bright variants tuned for shell-syntax-highlighting + git diff
- `atlas-ragnarok.glsl` — luminance-masked storm/fire vignette shader
  - Thunder-blue tint at top edges (`vec3(0.055, 0.115, 0.320)`)
  - Crimson tint at bottom edges (`vec3(0.220, 0.014, 0.028)`)
  - Pure black through middle ~60% of viewport
  - Background-only mask keeps text crisp at every intensity
  - Top/bottom regions cleanly separated — no color mixing in the middle
- `screenshots/01-hero-vignette.png` — empty-terminal hero shot
- `LICENSE` — MIT
- `README.md` — install, palette table, shader knobs, compatibility notes

[Unreleased]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/AyoubTadlaoui/atlas-ragnarok/releases/tag/v1.0.0
