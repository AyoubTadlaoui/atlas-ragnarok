# Contributing to atlas-ragnarok

Thanks for considering a contribution. This is a small, focused project — a
Ghostty theme and one shader — so the contribution surface is intentionally
narrow. Bug reports, palette ports to other terminals, and shader tweaks are
all welcome.

## What's in scope

- **Bug fixes** to the theme or shader (illegible text on certain backgrounds,
  shader breaking on specific GPU drivers, palette drift across Ghostty versions).
- **Palette ports** to other terminals (Alacritty, Kitty, WezTerm, iTerm2,
  Windows Terminal, etc.). Drop them under `themes/<terminal>/` and update the
  Compatibility section of the README.
- **Shader knob proposals** — e.g. an opt-in animated lightning flicker, a
  tighter vignette mode, an OLED-only no-vignette variant. New shaders go in
  `shaders/` next to `atlas-ragnarok.glsl`; the existing default doesn't change.
- **Documentation** — typo fixes, clearer install instructions, additional
  screenshots showcasing real workflows (vim, neovim, btop, tmux splits).

## What's out of scope

- **New color schemes that aren't atlas-ragnarok.** The palette is intentional;
  if you want a different theme, fork and rename.
- **Adding unrelated tools** (prompts, font configs, dotfiles). Ghostty config
  + GLSL only.

## How to submit

1. Fork the repo and create a feature branch (`feat/<short-description>` or
   `fix/<short-description>`).
2. Make the change. Keep diffs small and focused — one logical change per PR.
3. If you touch the palette, run `bash scripts/demo.sh` in a Ghostty window
   with the theme active and attach screenshots of any scenes whose colors
   visibly changed.
4. Open a PR against `main`. Reference the issue if one exists.
5. Be patient — this is a solo-maintained project.

## Local development

To preview your changes:

```bash
cp atlas-ragnarok.conf ~/.config/ghostty/themes/atlas-ragnarok.conf
cp atlas-ragnarok.glsl ~/.config/ghostty/shaders/atlas-ragnarok.glsl
# Reload Ghostty (Cmd+Shift+, on macOS, Ctrl+Shift+, on Linux)
```

For shader tweaks, intensity knobs are documented at the bottom of
`atlas-ragnarok.glsl`. Ghostty hot-reloads `.glsl` changes — no restart
needed for shader iteration.

## Commit messages

Plain prose, imperative mood. No prefixes required (no `feat:` / `fix:` /
etc.) — the project doesn't run conventional-commits tooling. Just describe
what the commit does and, if non-obvious, why.

## License

By contributing, you agree your contributions are licensed under the project's
[MIT License](LICENSE).
