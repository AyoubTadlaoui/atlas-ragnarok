# atlas-ragnarok

![atlas-ragnarok hero](screenshots/01-hero-vignette.png)

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

<details open>
<summary><b>macOS</b></summary>

```bash
git clone https://github.com/AyoubTadlaoui/atlas-ragnarok.git
cd atlas-ragnarok

mkdir -p ~/.config/ghostty/themes ~/.config/ghostty/shaders
cp atlas-ragnarok.conf ~/.config/ghostty/themes/
cp atlas-ragnarok.glsl ~/.config/ghostty/shaders/

# Activate it
echo 'config-file = ~/.config/ghostty/themes/atlas-ragnarok.conf' \
  >> "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
```

Reload with `Cmd+Shift+,` or restart Ghostty.

</details>

<details>
<summary><b>Linux</b></summary>

```bash
git clone https://github.com/AyoubTadlaoui/atlas-ragnarok.git
cd atlas-ragnarok

mkdir -p ~/.config/ghostty/themes ~/.config/ghostty/shaders
cp atlas-ragnarok.conf ~/.config/ghostty/themes/
cp atlas-ragnarok.glsl ~/.config/ghostty/shaders/

# Activate it
echo 'config-file = ~/.config/ghostty/themes/atlas-ragnarok.conf' \
  >> ~/.config/ghostty/config
```

Reload with `Ctrl+Shift+,` or restart Ghostty.

</details>

<details>
<summary><b>Windows (WSL2)</b></summary>

Ghostty doesn't yet ship a native Windows build. Run it under WSL2 with an
X-server (WSLg on Windows 11 handles this automatically).

```bash
# Inside your WSL2 shell
git clone https://github.com/AyoubTadlaoui/atlas-ragnarok.git
cd atlas-ragnarok

mkdir -p ~/.config/ghostty/themes ~/.config/ghostty/shaders
cp atlas-ragnarok.conf ~/.config/ghostty/themes/
cp atlas-ragnarok.glsl ~/.config/ghostty/shaders/

echo 'config-file = ~/.config/ghostty/themes/atlas-ragnarok.conf' \
  >> ~/.config/ghostty/config
```

Restart Ghostty in WSLg. If you're on Windows 10 (no WSLg), install
[VcXsrv](https://sourceforge.net/projects/vcxsrv/) and set `DISPLAY` in
your WSL profile.

> Want the palette in **Windows Terminal** or **WezTerm** instead?
> See [Compatibility](#compatibility) — the `palette = N=#hex` lines
> map cleanly to either format. The vignette shader is Ghostty-only.

</details>

<details>
<summary><b>PowerShell one-liner (downloads without git)</b></summary>

For Windows users who want the raw files without `git`:

```powershell
$dest = "$HOME\.config\ghostty"
New-Item -ItemType Directory -Force -Path "$dest\themes","$dest\shaders" | Out-Null
Invoke-WebRequest "https://raw.githubusercontent.com/AyoubTadlaoui/atlas-ragnarok/main/atlas-ragnarok.conf" -OutFile "$dest\themes\atlas-ragnarok.conf"
Invoke-WebRequest "https://raw.githubusercontent.com/AyoubTadlaoui/atlas-ragnarok/main/atlas-ragnarok.glsl" -OutFile "$dest\shaders\atlas-ragnarok.glsl"
Add-Content "$dest\config" "config-file = ~/.config/ghostty/themes/atlas-ragnarok.conf"
```

</details>

<details>
<summary><b>One-shot curl (macOS / Linux, no git)</b></summary>

```bash
mkdir -p ~/.config/ghostty/themes ~/.config/ghostty/shaders
curl -fsSL https://raw.githubusercontent.com/AyoubTadlaoui/atlas-ragnarok/main/atlas-ragnarok.conf \
  -o ~/.config/ghostty/themes/atlas-ragnarok.conf
curl -fsSL https://raw.githubusercontent.com/AyoubTadlaoui/atlas-ragnarok/main/atlas-ragnarok.glsl \
  -o ~/.config/ghostty/shaders/atlas-ragnarok.glsl

CONFIG="$HOME/.config/ghostty/config"
[[ "$OSTYPE" == "darwin"* ]] && CONFIG="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
echo 'config-file = ~/.config/ghostty/themes/atlas-ragnarok.conf' >> "$CONFIG"
```

</details>

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

## Capturing your own screenshots

A small demo script ships in `scripts/demo.sh` — it walks through four
screen-ready scenes (the shader source under `bat`, a colorful `git log
--graph`, a fake `cargo` build with errors + warnings + pass, and a
`tree` of the repo). Run it and screenshot each scene:

```bash
# auto-advance every 4 seconds
bash scripts/demo.sh

# or press <enter> to advance manually
bash scripts/demo.sh manual
```

Drop captures into `screenshots/` and they're live in this README on push.

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
