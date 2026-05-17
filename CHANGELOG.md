# Changelog

All notable changes to **atlas-ragnarok** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Multi-platform install instructions (macOS, Linux, Windows / WSL2)
- PowerShell one-liner for Windows users without `git`
- One-shot `curl` install for macOS/Linux without `git`
- Shields.io badges in README header (License, Ghostty, release, stars, last commit)
- `scripts/demo.sh` — four-scene screenshot helper for the README

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

[Unreleased]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/AyoubTadlaoui/atlas-ragnarok/releases/tag/v1.0.0
