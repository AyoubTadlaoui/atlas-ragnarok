# Atlas Ragnarok — Neovim

> Tech-blue thunder above. Crimson fire below. Pure black through the middle.
> Neovim colorscheme with full Treesitter + LSP + popular-plugin coverage.

## Install

**lazy.nvim**

```lua
{
  "AyoubTadlaoui/atlas-ragnarok",
  branch = "main",
  -- The colorscheme lives in editors/neovim/. Lazy needs the subdirectory:
  config = function()
    vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/atlas-ragnarok/editors/neovim")
    vim.cmd.colorscheme("atlas-ragnarok")
  end,
}
```

**packer.nvim**

```lua
use({
  "AyoubTadlaoui/atlas-ragnarok",
  rtp = "editors/neovim",
  config = function() vim.cmd.colorscheme("atlas-ragnarok") end,
})
```

**vim-plug**

```vim
Plug 'AyoubTadlaoui/atlas-ragnarok', { 'rtp': 'editors/neovim' }
colorscheme atlas-ragnarok
```

**Manual**

```bash
mkdir -p ~/.config/nvim/colors ~/.config/nvim/lua
cp editors/neovim/colors/atlas-ragnarok.lua ~/.config/nvim/colors/
cp -r editors/neovim/lua/atlas-ragnarok ~/.config/nvim/lua/
```

Then in `init.lua`:

```lua
vim.cmd.colorscheme("atlas-ragnarok")
```

## Coverage

- All standard vim syntax groups
- Treesitter highlights (`@function`, `@string`, `@type`, `@variable`, etc.)
- LSP diagnostics + reference highlights + inlay hints
- Popular plugins: gitsigns, nvim-tree, neo-tree, telescope, nvim-cmp, which-key
- Built-in terminal palette

Requires Neovim ≥ 0.8 with `termguicolors`.
