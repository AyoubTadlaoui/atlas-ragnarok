-- atlas-ragnarok — WezTerm palette port
--
-- Install:
--   1. Drop this file at ~/.config/wezterm/colors/atlas-ragnarok.lua
--   2. In your wezterm.lua:
--        local wezterm = require 'wezterm'
--        return {
--          color_scheme = 'atlas-ragnarok',
--          color_schemes = {
--            ['atlas-ragnarok'] = require 'colors.atlas-ragnarok',
--          },
--        }
--
-- The vignette shader (atlas-ragnarok.glsl) is Ghostty-exclusive —
-- WezTerm uses its own WGSL shader system and won't run the GLSL directly.
-- A WGSL port of the shader is a future enhancement.

return {
  -- Basic
  foreground          = '#ffffff',
  background          = '#000000',
  cursor_bg           = '#3b82f6',
  cursor_fg           = '#ffffff',
  cursor_border       = '#3b82f6',
  selection_fg        = '#ffffff',
  selection_bg        = '#1e3a5f',

  -- Scrollbar
  scrollbar_thumb     = '#505050',

  -- Split borders
  split               = '#505050',

  -- ANSI palette (standard)
  ansi = {
    '#000000', -- black
    '#ff8080', -- red
    '#99ffe4', -- green (peppermint)
    '#2563eb', -- yellow → thunder-blue-600
    '#a0a0a0', -- blue → gray (Vesper convention)
    '#3b82f6', -- magenta → thunder-blue-500
    '#99ffe4', -- cyan (peppermint)
    '#ffffff', -- white
  },

  -- ANSI palette (bright)
  brights = {
    '#505050', -- bright black
    '#ff9999', -- bright red
    '#b3ffe4', -- bright green
    '#60a5fa', -- bright yellow → thunder-blue-400
    '#b0b0b0', -- bright blue → light gray
    '#93c5fd', -- bright magenta → thunder-blue-300
    '#99ffe4', -- bright cyan
    '#ffffff', -- bright white
  },

  -- Tab bar
  tab_bar = {
    background = '#000000',
    active_tab = {
      bg_color = '#3b82f6',
      fg_color = '#000000',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#000000',
      fg_color = '#a0a0a0',
    },
    inactive_tab_hover = {
      bg_color = '#1e3a5f',
      fg_color = '#ffffff',
    },
    new_tab = {
      bg_color = '#000000',
      fg_color = '#99ffe4',
    },
    new_tab_hover = {
      bg_color = '#1e3a5f',
      fg_color = '#99ffe4',
    },
  },
}
