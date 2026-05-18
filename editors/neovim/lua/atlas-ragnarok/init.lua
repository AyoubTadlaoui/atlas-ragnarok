-- atlas-ragnarok.nvim — load the colorscheme.
local M = {}

function M.setup(opts)
  opts = opts or {}
  vim.cmd.colorscheme("atlas-ragnarok")
end

function M.load()
  vim.cmd.colorscheme("atlas-ragnarok")
end

return M
