# Atlas Ragnarok — storm-fire background

`atlas-ragnarok-vignette.png` (3840×2160) is a static, text-free bake of the
[Ghostty shader](../atlas-ragnarok.glsl): thunder-blue glow along the top,
pure black through the middle ~40% (so text stays readable), crimson embers
along the bottom.

Use it on any app that supports a **background image**. Apps that support a
real-time shader (Ghostty) or a native gradient (WezTerm) should use those
instead — see the bottom of this file.

The middle band is intentionally black, so set the image to **fill / cover**
(not tile) and keep any dimming/opacity low — the image is already dark.

---

## Terminals (background image)

### iTerm2
Settings → Profiles → **Window** → Background Image → select
`atlas-ragnarok-vignette.png`. Set blending to ~`0.15` and tick **Scale to fit**.

### kitty
```conf
background_image          /path/to/atlas-ragnarok-vignette.png
background_image_layout   scaled
background_tint           0.0
```

### Windows Terminal (`settings.json`, in the Atlas Ragnarok profile)
```json
"backgroundImage": "C:/path/to/atlas-ragnarok-vignette.png",
"backgroundImageOpacity": 1.0,
"backgroundImageStretchMode": "uniformToFill"
```

### Konsole
Settings → Edit Profile → **Appearance** → Background → set the wallpaper to
`atlas-ragnarok-vignette.png`, fill mode **Crop**.

---

## Editors (background image)

### JetBrains IDEs (IntelliJ, PyCharm, WebStorm, …)
`Shift Shift` → "Set Background Image" → choose `atlas-ragnarok-vignette.png`
→ Fill / **Scale**, Opacity ~`10`, "Editor and Tool Windows".

> GUI editors with solid-color-only backgrounds (Zed, VS Code, Sublime Text)
> cannot show this — they have no background-image or shader hook.

---

## Native gradient / shader (preferred where available)

### Ghostty
Already handled by the shader — no image needed:
```conf
custom-shader = atlas-ragnarok.glsl
```

### WezTerm (native vertical gradient — crisper than the image)
```lua
config.window_background_gradient = {
  orientation = 'Vertical',
  -- blue top → black → black → crimson bottom
  colors = { '#0e1d52', '#000000', '#000000', '#380407' },
}
```
Or, for the exact radial bake, use the image instead:
```lua
config.window_background_image = '/path/to/atlas-ragnarok-vignette.png'
config.window_background_image_hsb = { brightness = 1.0 }
```

---

## Regenerating

The PNG is a CPU bake of `atlas-ragnarok.glsl` against pure black: thunder-blue
`(0.055, 0.115, 0.320)` top, crimson `(0.220, 0.014, 0.028)` bottom,
`smoothstep(0.18, 1.0)` distance vignette, top/bottom bands at
`smoothstep(0.65, 0.85)`. Render at any resolution against a black canvas to
reproduce.
