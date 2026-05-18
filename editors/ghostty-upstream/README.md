# Ghostty bundled-theme submission

Ghostty ships its built-in theme list from
[`mbadolato/iTerm2-Color-Schemes`](https://github.com/mbadolato/iTerm2-Color-Schemes)
(included as a submodule). Once a theme lands there, the **next Ghostty
release picks it up automatically** and users can pick it via:

```bash
ghostty +list-themes        # confirm it's listed
# in config:
theme = atlas-ragnarok
```

The same PR also surfaces the theme to Alacritty, Kitty, WezTerm, Hyper, Konsole,
and ~30 other terminal emulators that consume the same submodule. One PR,
multi-terminal distribution.

## Submission

1. Fork [`mbadolato/iTerm2-Color-Schemes`](https://github.com/mbadolato/iTerm2-Color-Schemes)
2. Drop `atlas-ragnarok.itermcolors` (this directory) into `schemes/`
3. Run the regen script that mints the other formats:
   ```bash
   cd iTerm2-Color-Schemes
   tools/preview.rb           # generates README preview
   ./build.sh                 # regens all per-terminal formats
   ```
4. Commit + push + open a PR. The maintainer (Mario Badolato) usually merges
   color-only contributions within a few days.

## Why the upstream route

The shader (`atlas-ragnarok.glsl`) is Ghostty-specific and **cannot** ship
via this submodule — the iTerm2-Color-Schemes repo only carries 8-color palette
data. Users who want the full storm-fire vignette still need to:

```bash
git clone https://github.com/AyoubTadlaoui/atlas-ragnarok
cp atlas-ragnarok/atlas-ragnarok.glsl ~/.config/ghostty/shaders/
# add `custom-shader = ~/.config/ghostty/shaders/atlas-ragnarok.glsl` to config
```

So the upstream PR gets the palette to **every Ghostty user** with one
config line, and the README directs the few who want the shader to a second
30-second install step.

## Direct-to-Ghostty PR

If iTerm2-Color-Schemes review stalls, the same `atlas-ragnarok.conf` can be
submitted directly to [`ghostty-org/ghostty`](https://github.com/ghostty-org/ghostty)
under `pkg/iterm2-colorschemes/iTerm2-Color-Schemes/schemes/` as a temporary
patch. Ghostty maintainers generally prefer the upstream route.
