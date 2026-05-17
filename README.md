# atlas-ragnarok

> Tech-blue thunder above. Crimson fire below. Pure black through the middle.
> The end-of-days terminal theme for [Ghostty](https://ghostty.org).

A Ghostty theme + custom shader inspired by the Norse apocalypse — where the
sky cracks open with electric storm-blue and the world burns crimson beneath.
The middle stays pure black. Text never gets tinted: a luminance mask keeps
code, prompts, and output perfectly legible at every shader intensity.

Built on the syntactic structure of [Vesper](https://github.com/raunofreiberg/vesper)
(the orange-and-peppermint Rauno Freiberg VSCode theme), with the orange family
remapped to a Tailwind blue gradient and a storm/fire vignette layered on top
of pure-black `#000000`.

---

## Install

### 1. Drop the two files into Ghostty's config directory

```bash
git clone https://github.com/AyoubTadlaoui/atlas-ragnarok.git
cd atlas-ragnarok

mkdir -p ~/.config/ghostty/themes ~/.config/ghostty/shaders
cp atlas-ragnarok.conf ~/.config/ghostty/themes/
cp atlas-ragnarok.glsl ~/.config/ghostty/shaders/
```

### 2. Activate it

Open `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`
(macOS) or `~/.config/ghostty/config` (Linux) and add:

```
config-file = ~/.config/ghostty/themes/atlas-ragnarok.conf
```

Reload Ghostty with `Cmd+Shift+,` (macOS) or restart it.

---

## Palette

ANSI colors are Vesper's 5-color system, with the warm-accent family replaced
by a tech-blue gradient (Tailwind `blue-600` → `blue-300`).

| Role | Hex | Sample |
|------|-----|--------|
| Background | `#000000` | pure black |
| Foreground | `#ffffff` | white |
| Thunder-blue primary | `#3b82f6` | functions, types, cursor |
| Thunder-blue deep | `#2563eb` | tags, numbers |
| Thunder-blue bright | `#60a5fa` | emphasis |
| Thunder-blue pale | `#93c5fd` | accents |
| Peppermint | `#99ffe4` | strings, symbols, git-added |
| Gray | `#a0a0a0` | keywords, operators, storage |
| Crimson | `#ff8080` | errors, invalid, git-deleted |
| Selection | `#1e3a5f` | deep navy |

## Shader

The `atlas-ragnarok.glsl` shader adds the storm-fire vignette:

- **Top ~30%** of the screen — thunder-blue glow (`#0e1d52`-ish, vignetted)
- **Bottom ~30%** of the screen — crimson glow (`#380404`-ish, vignetted)
- **Middle ~40%** — untouched pure black
- **Text pixels** — never tinted (luminance mask kicks in at `lum > 0.04`)

The intensity curves are tuned for OLED + modern LCD. If you want to dial it
up or down, the knobs are at the bottom of `atlas-ragnarok.glsl`:

```glsl
vec3 thunder_blue = vec3(0.055, 0.115, 0.320);  // raise for more sky
vec3 red_tint     = vec3(0.220, 0.014, 0.028);  // raise for more fire

float top_only    = smoothstep(0.65, 0.85, 1.0 - uv.y);  // wider blue band
float bottom_only = smoothstep(0.65, 0.85, uv.y);        // wider red band
```

---

## Compatibility

- **Ghostty** ≥ 1.0 — full support (theme + shader)
- **Other terminals** — the `palette = N=#hex` lines map cleanly to iTerm2 /
  Alacritty / Kitty / WezTerm palette format; port the colors but skip the
  shader (most other terminals don't run GLSL).

---

## Credits

- Palette structure inherited from [raunofreiberg/vesper](https://github.com/raunofreiberg/vesper) (MIT)
- Tailwind color tokens for the blue gradient
- Forged by [Atlas Kaisar](https://github.com/AyoubTadlaoui)

## License

[MIT](./LICENSE) — do whatever you want, just keep the copyright notice.
