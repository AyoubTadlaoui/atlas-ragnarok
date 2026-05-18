# Changelog

All notable changes to **atlas-ragnarok** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.4] — 2026-05-18

### Fixed

- Added `LICENSE` to `editors/zed/` so Zed's extension validator finds
  one at the path it actually checks (submodulePath + the `path` field
  in `extensions.toml`, i.e. `extensions/atlas-ragnarok/editors/zed/`).
  Previously only the repo-root `LICENSE` existed; the validator
  doesn't walk up. Required to unblock
  [`zed-industries/extensions#6129`](https://github.com/zed-industries/extensions/pull/6129).

## [1.2.3] — 2026-05-18

### Fixed

- JetBrains build: added `instrumentationTools()` to the
  `intellijPlatform` dependencies block. The `:instrumentCode` Gradle task
  runs by default in IntelliJ Platform Gradle Plugin 2.x even for
  theme-only plugins, and refuses to proceed without a Java compiler
  dependency.

## [1.2.2] — 2026-05-18

### Fixed

- JetBrains build: `build.gradle.kts` used the deprecated `version.set(...)`
  syntax on `patchPluginXml`. With IntelliJ Platform Gradle Plugin 2.x the
  version is set via `intellijPlatform.pluginConfiguration { version = ... }`.
  Removed the `tasks { patchPluginXml { ... } }` block entirely.
- `.github/workflows/publish-editors.yml`: publish steps now use
  `continue-on-error: true` so a failing VS Code Marketplace publish (e.g.
  invalid `VSCE_PAT`) doesn't gate the Open VSX publish that comes next.
  Artifact-upload steps run with `if: always()` so the built VSIX / plugin
  ZIP is downloadable from the workflow even when publishing fails.

## [1.2.1] — 2026-05-18

### Fixed

- Removed dangling `icon.png` reference from `editors/vscode/package.json`
  that caused `vsce package` to fail in the publish workflow's first run.
- Added `LICENSE` files to `editors/vscode/` and `editors/jetbrains/` so
  the marketplace artifacts ship with a proper license alongside them
  (also silences `vsce`'s missing-LICENSE warning).
- Switched the JetBrains job in `.github/workflows/publish-editors.yml`
  from `./gradlew` (uncommitted wrapper) to `gradle` directly via
  `gradle/actions/setup-gradle@v4`'s `gradle-version: '8.10'`. The wrapper
  scripts are intentionally not committed — CI does not need a 50KB
  binary blob.

## [1.2.0] — 2026-05-18

### Added

- **Editor distribution.** Full color theme ports under [`editors/`](editors/) for
  VS Code (+ Cursor / VSCodium / Open VSX), Zed, JetBrains (IntelliJ family +
  Android Studio), Neovim, classic Vim, Helix, and Sublime Text 4. Single
  source-of-truth palette at [`editors/palette.json`](editors/palette.json) so
  every port stays in sync. See [EDITORS.md](EDITORS.md) for the install +
  publish matrix.
- **`.github/workflows/publish-editors.yml`** — fans out a single `v*` tag to
  VS Code Marketplace, Open VSX, and JetBrains Marketplace. Missing tokens skip
  the corresponding job cleanly; Zed / Helix / Sublime / Ghostty go through
  human-reviewed PRs to upstream repos and are intentionally not automated.
- **`editors/ghostty-upstream/`** — packaged submission for
  [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes),
  which Ghostty bundles via submodule. One PR gets the palette to Ghostty,
  Alacritty, Kitty, WezTerm, Hyper, Konsole, and ~30 other terminals.
- `screenshots/02-demo.webp` — animated WebP showing all four `scripts/demo.sh`
  scenes (shader code under `bat`, `git log --graph`, stubbed `cargo` build with
  warnings + errors + green tests, tree + palette listing) rendered in the
  atlas-ragnarok palette. Embedded in the README under "The palette in motion".
- `screenshots/02-demo.mp4` — same demo as H.264 MP4, kept as a supplementary
  download link.
- `screenshots/demo.tape` — [vhs](https://github.com/charmbracelet/vhs) script
  that drives `scripts/demo.sh` through `ttyd` with the theme palette,
  edge-to-edge (no window chrome) so the post-process vignette overlay sits
  flush over the canvas.
- `screenshots/_shader.py` — NumPy+PIL reimplementation of
  `atlas-ragnarok.glsl`, pixel-exact. Applies the full shader equation
  to every captured frame: same `thunder_blue = vec3(0.055, 0.115, 0.320)`
  and `red_tint = vec3(0.220, 0.014, 0.028)` colors, same
  `smoothstep(0.18, 1.0, dist)` radial vignette, same
  `smoothstep(0.65, 0.85, …)` top/bottom bands, and crucially the same
  `bg_mask = 1 - smoothstep(0.04, 0.18, lum)` luminance mask — so text
  pixels never get tinted, matching the live GPU shader's behavior.
  Replaces the earlier static-overlay approach which couldn't honor the
  luminance mask and washed out text in the tinted bands.
- `screenshots/gen.sh` — one-shot regeneration of the animated assets:
  `brew install vhs ffmpeg webp bat tree` +
  `pip3 install --user --break-system-packages pillow numpy` once, then
  `sh screenshots/gen.sh` on any release. The static
  `01-hero-vignette.png` is left alone — it's hand-captured from a real
  Ghostty session so the live GPU shader is the source.

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

[Unreleased]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.2.4...HEAD
[1.2.4]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.2.3...v1.2.4
[1.2.3]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/AyoubTadlaoui/atlas-ragnarok/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/AyoubTadlaoui/atlas-ragnarok/releases/tag/v1.0.0
