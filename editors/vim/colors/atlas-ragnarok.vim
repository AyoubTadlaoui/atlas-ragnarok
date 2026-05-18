" atlas-ragnarok colorscheme for Vim (classic, not Neovim).
" Tech-blue thunder above. Crimson fire below. Pure black through the middle.
" https://github.com/AyoubTadlaoui/atlas-ragnarok

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "atlas-ragnarok"

if !has("gui_running") && &t_Co < 256
  finish
endif

" Palette
let s:bg              = "#000000"
let s:bg_alt          = "#0a0a0a"
let s:bg_subtle       = "#101010"
let s:bg_selection    = "#1e3a5f"
let s:bg_line         = "#0b1220"
let s:fg              = "#ffffff"
let s:fg_muted        = "#a0a0a0"
let s:fg_subtle       = "#505050"
let s:thunder         = "#3b82f6"
let s:thunder_deep    = "#2563eb"
let s:thunder_bright  = "#60a5fa"
let s:thunder_pale    = "#93c5fd"
let s:peppermint      = "#99ffe4"
let s:peppermint_alt  = "#b3ffe4"
let s:crimson         = "#ff8080"
let s:crimson_alt     = "#ff9999"
let s:gray            = "#a0a0a0"

function! s:hi(group, fg, bg, attr) abort
  let l:cmd = 'hi ' . a:group
  if a:fg !=# 'NONE' | let l:cmd .= ' guifg=' . a:fg | endif
  if a:bg !=# 'NONE' | let l:cmd .= ' guibg=' . a:bg | endif
  if a:attr !=# 'NONE' | let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr | endif
  execute l:cmd
endfunction

" ─── UI ─────────────────────────────────────────────────────────────────────
call s:hi('Normal',       s:fg,           s:bg,           'NONE')
call s:hi('NormalFloat',  s:fg,           s:bg_alt,       'NONE')
call s:hi('Cursor',       s:bg,           s:thunder,      'NONE')
call s:hi('CursorLine',   'NONE',         s:bg_line,      'NONE')
call s:hi('CursorLineNr', s:fg,           'NONE',         'bold')
call s:hi('LineNr',       s:fg_subtle,    'NONE',         'NONE')
call s:hi('SignColumn',   'NONE',         s:bg,           'NONE')
call s:hi('VertSplit',    s:fg_subtle,    s:bg,           'NONE')
call s:hi('StatusLine',   s:thunder_pale, s:bg,           'NONE')
call s:hi('StatusLineNC', s:fg_subtle,    s:bg,           'NONE')
call s:hi('TabLine',      s:fg_subtle,    s:bg,           'NONE')
call s:hi('TabLineFill',  'NONE',         s:bg,           'NONE')
call s:hi('TabLineSel',   s:fg,           s:bg,           'bold')

call s:hi('Pmenu',        s:fg,           s:bg_alt,       'NONE')
call s:hi('PmenuSel',     s:fg,           s:bg_selection, 'NONE')
call s:hi('PmenuSbar',    'NONE',         s:bg_subtle,    'NONE')
call s:hi('PmenuThumb',   'NONE',         s:fg_subtle,    'NONE')

call s:hi('Visual',       'NONE',         s:bg_selection, 'NONE')
call s:hi('Search',       s:fg,           s:thunder_deep, 'NONE')
call s:hi('IncSearch',    s:bg,           s:thunder_bright,'NONE')
call s:hi('MatchParen',   s:thunder,      s:bg_selection, 'bold')

call s:hi('Folded',       s:fg_muted,     s:bg_alt,       'NONE')
call s:hi('FoldColumn',   s:fg_subtle,    s:bg,           'NONE')
call s:hi('ColorColumn',  'NONE',         s:bg_alt,       'NONE')

call s:hi('Directory',    s:thunder,      'NONE',         'NONE')
call s:hi('Title',        s:thunder,      'NONE',         'bold')
call s:hi('NonText',      '#202020',      'NONE',         'NONE')
call s:hi('SpecialKey',   '#202020',      'NONE',         'NONE')

call s:hi('ErrorMsg',     s:crimson,      'NONE',         'NONE')
call s:hi('WarningMsg',   s:thunder_deep, 'NONE',         'NONE')
call s:hi('ModeMsg',      s:fg,           'NONE',         'NONE')
call s:hi('MoreMsg',      s:peppermint,   'NONE',         'NONE')
call s:hi('Question',     s:thunder_bright,'NONE',        'NONE')

call s:hi('DiffAdd',      s:peppermint,   '#062f2f',      'NONE')
call s:hi('DiffChange',   s:thunder_bright,'#0a1a2f',     'NONE')
call s:hi('DiffDelete',   s:crimson,      '#2f0606',      'NONE')
call s:hi('DiffText',     s:fg,           s:bg_selection, 'NONE')

" ─── Syntax ─────────────────────────────────────────────────────────────────
call s:hi('Comment',       s:fg_subtle,     'NONE', 'italic')
call s:hi('Constant',      s:thunder_bright,'NONE', 'NONE')
call s:hi('String',        s:peppermint,    'NONE', 'NONE')
call s:hi('Character',     s:peppermint,    'NONE', 'NONE')
call s:hi('Number',        s:thunder_deep,  'NONE', 'NONE')
call s:hi('Boolean',       s:thunder_deep,  'NONE', 'NONE')
call s:hi('Float',         s:thunder_deep,  'NONE', 'NONE')
call s:hi('Identifier',    s:fg,            'NONE', 'NONE')
call s:hi('Function',      s:thunder,       'NONE', 'NONE')
call s:hi('Statement',     s:gray,          'NONE', 'NONE')
call s:hi('Conditional',   s:gray,          'NONE', 'NONE')
call s:hi('Repeat',        s:gray,          'NONE', 'NONE')
call s:hi('Label',         s:thunder_bright,'NONE', 'NONE')
call s:hi('Operator',      s:gray,          'NONE', 'NONE')
call s:hi('Keyword',       s:gray,          'NONE', 'NONE')
call s:hi('Exception',     s:crimson,       'NONE', 'NONE')
call s:hi('PreProc',       s:thunder_pale,  'NONE', 'NONE')
call s:hi('Include',       s:gray,          'NONE', 'NONE')
call s:hi('Define',        s:thunder_pale,  'NONE', 'NONE')
call s:hi('Macro',         s:thunder_pale,  'NONE', 'NONE')
call s:hi('PreCondit',     s:thunder_pale,  'NONE', 'NONE')
call s:hi('Type',          s:thunder,       'NONE', 'NONE')
call s:hi('StorageClass',  s:gray,          'NONE', 'NONE')
call s:hi('Structure',     s:thunder,       'NONE', 'NONE')
call s:hi('Typedef',       s:thunder,       'NONE', 'NONE')
call s:hi('Special',       s:peppermint_alt,'NONE', 'NONE')
call s:hi('SpecialChar',   s:peppermint_alt,'NONE', 'NONE')
call s:hi('Tag',           s:thunder_deep,  'NONE', 'NONE')
call s:hi('Delimiter',     s:gray,          'NONE', 'NONE')
call s:hi('SpecialComment',s:thunder_pale,  'NONE', 'NONE')
call s:hi('Debug',         s:crimson,       'NONE', 'NONE')
call s:hi('Underlined',    s:thunder_bright,'NONE', 'underline')
call s:hi('Ignore',        s:fg_subtle,     'NONE', 'NONE')
call s:hi('Error',         s:crimson,       'NONE', 'undercurl')
call s:hi('Todo',          s:thunder_deep,  'NONE', 'bold')

delfunction s:hi
