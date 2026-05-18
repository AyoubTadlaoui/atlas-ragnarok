-- atlas-ragnarok colorscheme for Neovim ≥ 0.8
-- Tech-blue thunder above. Crimson fire below. Pure black through the middle.
-- https://github.com/AyoubTadlaoui/atlas-ragnarok

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "atlas-ragnarok"

local c = require("atlas-ragnarok.palette").colors

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ────────────────────────────────────────────────────────────────────────────
-- UI
hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_alt })
hi("NormalNC",      { fg = c.fg, bg = c.bg })
hi("FloatBorder",   { fg = c.fg_subtle, bg = c.bg_alt })
hi("Cursor",        { fg = c.bg, bg = c.thunder })
hi("CursorLine",    { bg = c.bg_line })
hi("CursorColumn",  { bg = c.bg_line })
hi("CursorLineNr",  { fg = c.fg, bold = true })
hi("LineNr",        { fg = c.fg_subtle })
hi("SignColumn",    { bg = c.bg })
hi("ColorColumn",   { bg = c.bg_alt })
hi("VertSplit",     { fg = c.fg_subtle, bg = c.bg })
hi("WinSeparator",  { fg = c.fg_subtle, bg = c.bg })

hi("StatusLine",    { fg = c.thunder_pale, bg = c.bg })
hi("StatusLineNC",  { fg = c.fg_subtle, bg = c.bg })
hi("TabLine",       { fg = c.fg_subtle, bg = c.bg })
hi("TabLineFill",   { bg = c.bg })
hi("TabLineSel",    { fg = c.fg, bg = c.bg, bold = true })

hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.fg, bg = c.bg_selection })
hi("PmenuSbar",     { bg = c.bg_subtle })
hi("PmenuThumb",    { bg = c.fg_subtle })

hi("Visual",        { bg = c.bg_selection })
hi("VisualNOS",     { bg = c.bg_selection })
hi("Search",        { fg = c.fg, bg = c.thunder_deep })
hi("IncSearch",     { fg = c.bg, bg = c.thunder_bright })
hi("CurSearch",     { fg = c.bg, bg = c.thunder_bright })
hi("MatchParen",    { fg = c.thunder, bg = c.bg_selection, bold = true })

hi("Folded",        { fg = c.fg_muted, bg = c.bg_alt })
hi("FoldColumn",    { fg = c.fg_subtle, bg = c.bg })

hi("Directory",     { fg = c.thunder })
hi("Title",         { fg = c.thunder, bold = true })
hi("Conceal",       { fg = c.fg_subtle })
hi("NonText",       { fg = c.gray_dark })
hi("SpecialKey",    { fg = c.gray_dark })
hi("EndOfBuffer",   { fg = c.bg })
hi("Whitespace",    { fg = c.gray_dark })

hi("ErrorMsg",      { fg = c.crimson })
hi("WarningMsg",    { fg = c.thunder_deep })
hi("ModeMsg",       { fg = c.fg })
hi("MoreMsg",       { fg = c.peppermint })
hi("Question",      { fg = c.thunder_bright })

hi("DiffAdd",       { fg = c.peppermint, bg = "#062f2f" })
hi("DiffChange",    { fg = c.thunder_bright, bg = "#0a1a2f" })
hi("DiffDelete",    { fg = c.crimson, bg = "#2f0606" })
hi("DiffText",      { fg = c.fg, bg = "#1e3a5f" })

hi("SpellBad",      { sp = c.crimson, undercurl = true })
hi("SpellCap",      { sp = c.thunder_bright, undercurl = true })
hi("SpellRare",     { sp = c.thunder_pale, undercurl = true })
hi("SpellLocal",    { sp = c.peppermint, undercurl = true })

-- ────────────────────────────────────────────────────────────────────────────
-- Syntax (classic vim groups)
hi("Comment",        { fg = c.fg_subtle, italic = true })
hi("Constant",       { fg = c.thunder_bright })
hi("String",         { fg = c.peppermint })
hi("Character",      { fg = c.peppermint })
hi("Number",         { fg = c.thunder_deep })
hi("Boolean",        { fg = c.thunder_deep })
hi("Float",          { fg = c.thunder_deep })

hi("Identifier",     { fg = c.fg })
hi("Function",       { fg = c.thunder })

hi("Statement",      { fg = c.gray })
hi("Conditional",    { fg = c.gray })
hi("Repeat",         { fg = c.gray })
hi("Label",          { fg = c.thunder_bright })
hi("Operator",       { fg = c.gray })
hi("Keyword",        { fg = c.gray })
hi("Exception",      { fg = c.crimson })

hi("PreProc",        { fg = c.thunder_pale })
hi("Include",        { fg = c.gray })
hi("Define",         { fg = c.thunder_pale })
hi("Macro",          { fg = c.thunder_pale })
hi("PreCondit",      { fg = c.thunder_pale })

hi("Type",           { fg = c.thunder })
hi("StorageClass",   { fg = c.gray })
hi("Structure",      { fg = c.thunder })
hi("Typedef",        { fg = c.thunder })

hi("Special",        { fg = c.peppermint_alt })
hi("SpecialChar",    { fg = c.peppermint_alt })
hi("Tag",            { fg = c.thunder_deep })
hi("Delimiter",      { fg = c.gray })
hi("SpecialComment", { fg = c.thunder_pale })
hi("Debug",          { fg = c.crimson })

hi("Underlined",     { fg = c.thunder_bright, underline = true })
hi("Ignore",         { fg = c.fg_subtle })
hi("Error",          { fg = c.crimson, undercurl = true })
hi("Todo",           { fg = c.thunder_deep, bold = true })

-- ────────────────────────────────────────────────────────────────────────────
-- Treesitter
hi("@comment",                { link = "Comment" })
hi("@comment.documentation",  { fg = c.fg_muted, italic = true })
hi("@comment.error",          { fg = c.crimson })
hi("@comment.warning",        { fg = c.thunder_deep })
hi("@comment.todo",           { fg = c.thunder_deep, bold = true })
hi("@comment.note",           { fg = c.thunder_pale })

hi("@string",                 { fg = c.peppermint })
hi("@string.escape",          { fg = c.peppermint_alt })
hi("@string.regexp",          { fg = c.peppermint })
hi("@string.special",         { fg = c.peppermint_alt })

hi("@character",              { fg = c.peppermint })
hi("@character.special",      { fg = c.peppermint_alt })

hi("@number",                 { fg = c.thunder_deep })
hi("@boolean",                { fg = c.thunder_deep })
hi("@float",                  { fg = c.thunder_deep })

hi("@function",               { fg = c.thunder })
hi("@function.builtin",       { fg = c.thunder })
hi("@function.call",          { fg = c.thunder })
hi("@function.macro",         { fg = c.thunder_pale })
hi("@function.method",        { fg = c.thunder })
hi("@function.method.call",   { fg = c.thunder })
hi("@constructor",            { fg = c.thunder })

hi("@keyword",                { fg = c.gray })
hi("@keyword.function",       { fg = c.gray })
hi("@keyword.operator",       { fg = c.gray })
hi("@keyword.return",         { fg = c.gray })
hi("@keyword.import",         { fg = c.gray })
hi("@keyword.exception",      { fg = c.crimson })

hi("@conditional",            { fg = c.gray })
hi("@repeat",                 { fg = c.gray })
hi("@label",                  { fg = c.thunder_bright })
hi("@operator",               { fg = c.gray })

hi("@type",                   { fg = c.thunder })
hi("@type.builtin",           { fg = c.thunder })
hi("@type.definition",        { fg = c.thunder })
hi("@type.qualifier",         { fg = c.gray })

hi("@attribute",              { fg = c.thunder_pale })
hi("@property",               { fg = c.fg })
hi("@field",                  { fg = c.fg })

hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.thunder_pale })
hi("@variable.parameter",     { fg = c.fg })
hi("@variable.member",        { fg = c.fg })

hi("@constant",               { fg = c.thunder_bright })
hi("@constant.builtin",       { fg = c.thunder_bright })
hi("@constant.macro",         { fg = c.thunder_pale })

hi("@module",                 { fg = c.thunder_pale })
hi("@namespace",              { fg = c.thunder_pale })

hi("@punctuation",            { fg = c.gray })
hi("@punctuation.bracket",    { fg = c.gray })
hi("@punctuation.delimiter",  { fg = c.gray })
hi("@punctuation.special",    { fg = c.thunder })

hi("@tag",                    { fg = c.thunder_deep })
hi("@tag.attribute",          { fg = c.thunder_bright })
hi("@tag.delimiter",          { fg = c.gray })

hi("@markup.heading",         { fg = c.thunder, bold = true })
hi("@markup.strong",          { fg = c.fg, bold = true })
hi("@markup.italic",          { fg = c.fg, italic = true })
hi("@markup.underline",       { fg = c.fg, underline = true })
hi("@markup.strikethrough",   { fg = c.fg_subtle, strikethrough = true })
hi("@markup.link",            { fg = c.thunder_bright, underline = true })
hi("@markup.link.label",      { fg = c.peppermint })
hi("@markup.link.url",        { fg = c.thunder_bright })
hi("@markup.raw",             { fg = c.peppermint })
hi("@markup.quote",           { fg = c.fg_muted, italic = true })
hi("@markup.list",            { fg = c.thunder })

hi("@diff.plus",              { fg = c.peppermint })
hi("@diff.minus",             { fg = c.crimson })
hi("@diff.delta",             { fg = c.thunder_bright })

-- ────────────────────────────────────────────────────────────────────────────
-- LSP / Diagnostics
hi("DiagnosticError",         { fg = c.crimson })
hi("DiagnosticWarn",          { fg = c.thunder_deep })
hi("DiagnosticInfo",          { fg = c.thunder_pale })
hi("DiagnosticHint",          { fg = c.fg_muted })
hi("DiagnosticOk",            { fg = c.peppermint })
hi("DiagnosticUnderlineError",{ sp = c.crimson, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.thunder_deep, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.thunder_pale, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.fg_muted, undercurl = true })
hi("DiagnosticVirtualTextError", { fg = c.crimson, italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.thunder_deep, italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.thunder_pale, italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.fg_muted, italic = true })

hi("LspReferenceText",        { bg = c.bg_selection })
hi("LspReferenceRead",        { bg = c.bg_selection })
hi("LspReferenceWrite",       { bg = c.bg_selection, bold = true })
hi("LspSignatureActiveParameter", { fg = c.thunder, bold = true })
hi("LspCodeLens",             { fg = c.fg_subtle })
hi("LspInlayHint",            { fg = c.fg_subtle, italic = true })

-- ────────────────────────────────────────────────────────────────────────────
-- Plugins (popular ones, minimal overrides)
-- gitsigns.nvim
hi("GitSignsAdd",     { fg = c.peppermint })
hi("GitSignsChange",  { fg = c.thunder_bright })
hi("GitSignsDelete",  { fg = c.crimson })

-- nvim-tree / neo-tree
hi("NvimTreeFolderIcon",    { fg = c.thunder })
hi("NvimTreeFolderName",    { fg = c.fg })
hi("NvimTreeOpenedFolderName", { fg = c.fg, bold = true })
hi("NvimTreeRootFolder",    { fg = c.thunder, bold = true })
hi("NvimTreeFileName",      { fg = c.fg })
hi("NvimTreeGitDirty",      { fg = c.thunder_bright })
hi("NvimTreeGitNew",        { fg = c.peppermint })
hi("NvimTreeGitDeleted",    { fg = c.crimson })

-- telescope.nvim
hi("TelescopeNormal",       { fg = c.fg, bg = c.bg_alt })
hi("TelescopeBorder",       { fg = c.fg_subtle, bg = c.bg_alt })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_alt })
hi("TelescopePromptBorder", { fg = c.fg_subtle, bg = c.bg_alt })
hi("TelescopeSelection",    { fg = c.fg, bg = c.bg_selection })
hi("TelescopeMatching",     { fg = c.thunder_bright, bold = true })

-- nvim-cmp
hi("CmpItemAbbr",           { fg = c.fg })
hi("CmpItemAbbrMatch",      { fg = c.thunder_bright, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.thunder_bright })
hi("CmpItemKindFunction",   { fg = c.thunder })
hi("CmpItemKindMethod",     { fg = c.thunder })
hi("CmpItemKindVariable",   { fg = c.fg })
hi("CmpItemKindKeyword",    { fg = c.gray })
hi("CmpItemKindClass",      { fg = c.thunder })
hi("CmpItemKindInterface",  { fg = c.thunder_pale })
hi("CmpItemKindModule",     { fg = c.thunder_pale })

-- which-key.nvim
hi("WhichKey",          { fg = c.thunder })
hi("WhichKeyGroup",     { fg = c.thunder_pale })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.fg_subtle })
hi("WhichKeyFloat",     { bg = c.bg_alt })

-- ────────────────────────────────────────────────────────────────────────────
-- Terminal colors
vim.g.terminal_color_0  = c.bg
vim.g.terminal_color_1  = c.crimson
vim.g.terminal_color_2  = c.peppermint
vim.g.terminal_color_3  = c.thunder_deep
vim.g.terminal_color_4  = c.gray
vim.g.terminal_color_5  = c.thunder
vim.g.terminal_color_6  = c.peppermint
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.fg_subtle
vim.g.terminal_color_9  = c.crimson_alt
vim.g.terminal_color_10 = c.peppermint_alt
vim.g.terminal_color_11 = c.thunder_bright
vim.g.terminal_color_12 = c.gray_alt
vim.g.terminal_color_13 = c.thunder_pale
vim.g.terminal_color_14 = c.peppermint
vim.g.terminal_color_15 = c.fg
