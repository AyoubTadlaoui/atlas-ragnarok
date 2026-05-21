# Editor distribution

Atlas Ragnarok ships as a color theme to every major code editor. This file
is the install / publish reference.

## Install matrix

| Editor | Install | Marketplace | Status |
|---|---|---|---|
| **VSCodium / Gitpod / Eclipse Theia** | `codium --install-extension AyoubTadlaoui.atlas-ragnarok` | [Open VSX](https://open-vsx.org/extension/AyoubTadlaoui/atlas-ragnarok) | ✅ **Live** (v1.2.3, since 2026-05-18) |
| **VS Code / Cursor** | Download VSIX from Open VSX, then `code --install-extension <file>.vsix` | [Visual Studio Marketplace](https://marketplace.visualstudio.com) | ⏸ Pending — needs Azure DevOps PAT (`VSCE_PAT` secret) |
| **Zed** | `zed: install extension Atlas Ragnarok` (post-merge) | [zed-industries/extensions](https://github.com/zed-industries/extensions) | ⏳ [PR #6129](https://github.com/zed-industries/extensions/pull/6129) — all checks green, awaiting maintainer merge |
| **JetBrains** (IntelliJ, PyCharm, GoLand, WebStorm, Rider, RustRover, CLion, RubyMine, PhpStorm, DataGrip, Android Studio) | Plugins → Marketplace → Atlas Ragnarok (post-approval) | [plugins.jetbrains.com](https://plugins.jetbrains.com) | ⏳ [Plugin #31820](https://plugins.jetbrains.com/plugin/31820-atlas-ragnarok) — in moderation (1–2 business days) |
| **Helix** | `cp editors/helix/atlas-ragnarok.toml ~/.config/helix/themes/` and `:theme atlas-ragnarok` | [helix-editor/helix](https://github.com/helix-editor/helix) | ⏳ [PR #15754](https://github.com/helix-editor/helix/pull/15754) for upstream bundling; works locally now |
| **Sublime Text 4** | `Package Control → Install Package → Atlas Ragnarok` (post-merge) | [Package Control](https://packagecontrol.io) | ⏳ [PR #9421](https://github.com/sublimehq/package_control_channel/pull/9421) on `sublimehq/package_control_channel` |
| **Ghostty + ~30 terminals** | `theme = "Atlas Ragnarok"` (ships in the next Ghostty release); colors only — the storm-fire shader still needs the one-time `cp` from this repo | [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes) | ✅ [PR #697](https://github.com/mbadolato/iTerm2-Color-Schemes/pull/697) **merged** — flows to Ghostty, Alacritty, Kitty, WezTerm, Hyper, Konsole, Foot, Termite, Termux, +20 others |
| **Neovim** | `{ "AyoubTadlaoui/atlas-ragnarok", rtp = "editors/neovim" }` (lazy.nvim / packer) | GitHub-installable | ✅ Works today directly from this repo |
| **Vim** | `Plug 'AyoubTadlaoui/atlas-ragnarok', { 'rtp': 'editors/vim' }` | GitHub-installable | ✅ Works today directly from this repo |
| Alacritty, Kitty, WezTerm, iTerm2, Windows Terminal (manual) | See `themes/` directory at repo root | repo download | ✅ Works today directly from this repo |

Open VSX namespace verification (cosmetic "Verified" badge): [EclipseFdn/open-vsx.org#10421](https://github.com/EclipseFdn/open-vsx.org/issues/10421) — awaiting Eclipse Foundation review (3–7 business days).

## Repository layout

```
atlas-ragnarok/
├── atlas-ragnarok.conf        ← Ghostty config
├── atlas-ragnarok.glsl        ← Ghostty shader
├── themes/                    ← terminal palette ports
│   ├── alacritty.toml
│   ├── kitty.conf
│   ├── wezterm.lua
│   ├── iterm2.itermcolors
│   └── windows-terminal.json
└── editors/                   ← editor ports + publish manifests
    ├── palette.json           ← single source of truth (every editor reads from here)
    ├── vscode/                ← VS Code Marketplace + Open VSX
    ├── zed/                   ← Zed Extensions submission
    ├── jetbrains/             ← JetBrains Marketplace plugin
    ├── neovim/                ← Neovim colorscheme
    ├── vim/                   ← Classic Vim colorscheme
    ├── helix/                 ← Helix theme
    ├── sublime/               ← Sublime Text 4 color scheme
    └── ghostty-upstream/      ← iTerm2-Color-Schemes submission (Ghostty + ~30 terminals)
```

## Publishing

### VS Code Marketplace + Open VSX (one VSIX, two registries)

```bash
cd editors/vscode

# One-time tooling
npm install -g @vscode/vsce ovsx

# Build VSIX
vsce package

# Publish to Microsoft's Marketplace (needs Azure DevOps PAT)
vsce publish -p "$VSCE_PAT"

# Publish to Open VSX (needs Eclipse Foundation token)
ovsx publish atlas-ragnarok-1.0.0.vsix -p "$OVSX_PAT"
```

PATs:

- **VSCE_PAT**: [dev.azure.com → User Settings → Personal Access Tokens](https://dev.azure.com) → "Marketplace (manage)" scope
- **OVSX_PAT**: [open-vsx.org → User Settings → Tokens](https://open-vsx.org)

### Zed Extensions

```bash
git clone https://github.com/zed-industries/extensions
cd extensions
git submodule add https://github.com/AyoubTadlaoui/atlas-ragnarok.git extensions/atlas-ragnarok
# In extensions.toml, add:
#   [atlas-ragnarok]
#   submodule = "extensions/atlas-ragnarok"
#   path = "editors/zed"
#   version = "1.0.0"
# Commit + open PR
```

### JetBrains Marketplace

```bash
cd editors/jetbrains
./gradlew buildPlugin                 # JAR appears in build/distributions/
JETBRAINS_MARKETPLACE_TOKEN=hub-xxx \
  ./gradlew publishPlugin
```

Get token: [hub.jetbrains.com → Profile → Authentication](https://hub.jetbrains.com).

### Neovim / Vim

No marketplace step — users install directly from GitHub via their plugin
manager. Just tag a release. The `editors/neovim/` and `editors/vim/`
subdirectories are referenced via the plugin manager's `rtp` / `subdir` option.

### Helix

```bash
# Optional upstream contribution:
git clone https://github.com/helix-editor/helix
cp editors/helix/atlas-ragnarok.toml helix/runtime/themes/
# Open PR
```

Users who don't wait for upstream can drop the file in
`~/.config/helix/themes/` themselves.

### Sublime Text

Submit to [`wbond/package_control_channel`](https://github.com/wbond/package_control_channel) — see `editors/sublime/README.md`.

### Ghostty + ~30 other terminals

```bash
git clone https://github.com/mbadolato/iTerm2-Color-Schemes
cp editors/ghostty-upstream/atlas-ragnarok.itermcolors \
   iTerm2-Color-Schemes/schemes/
cd iTerm2-Color-Schemes
./build.sh                            # mints all per-terminal formats
git add . && git commit -m "Add Atlas Ragnarok theme"
# Open PR
```

The shader (`atlas-ragnarok.glsl`) cannot ship via this submodule — it's
Ghostty-specific. Users who want the storm-fire vignette still need the
manual 30-second copy step from this repo's README.

## CI automation (recommended)

A future `.github/workflows/publish-editors.yml` workflow can fan out a single
`v*` tag to: VS Code Marketplace, Open VSX, JetBrains Marketplace. Zed,
Helix, Sublime, and Ghostty go through human-reviewed PRs to upstream repos
and aren't safe to automate.

Token secrets to add to the repo:

| Secret | Where to get | What it unlocks |
|---|---|---|
| `VSCE_PAT` | [dev.azure.com](https://dev.azure.com) PAT, "Marketplace (manage)" | VS Code Marketplace publish |
| `OVSX_PAT` | [open-vsx.org](https://open-vsx.org) user settings | Open VSX publish |
| `JETBRAINS_MARKETPLACE_TOKEN` | [hub.jetbrains.com](https://hub.jetbrains.com) | JetBrains Marketplace publish |
