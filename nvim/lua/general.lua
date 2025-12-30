---------------------------------------------------------------
---                         General                         ---
---------------------------------------------------------------

vim.o.number = true
vim.o.relativenumber = true
vim.o.title = true

vim.o.shell = "/opt/homebrew/bin/fish"
-- Sets how many lines of history VIM has to remember
vim.o.history = 100

-- Enable filetype plugins
-- TODO: This should be the nvim default... need to check
-- vim.o.filetype plugin indent on


-- Set to auto read when a file is changed from the outside
vim.o.autoread = true
-- FIXME: au FocusGained,BufEnter * checktime

-- Visual mode with mouse
vim.o.mouse = 'a'
vim.o.mousemodel = extend

vim.o.updatetime = 300

---------------------------------------------------------------
---                            UI                           ---
---------------------------------------------------------------

-- Add a 3 lines buffer between the cursor and beginning/end of file
vim.o.so = 3

-- Avoid garbled characters in Chinese language windows OS
vim.o.langmenu = "en"

-- Turn on the Wild menu
vim.o.wildmenu = true

-- Ignore compiled files
vim.o.wildignore = "*.o","*~","*.pyc","*/.git/*","*/.hg/*","*/.svn/*","*/.DS_Store"

-- Always show current position
vim.o.ruler = true

-- Height of the command bar
vim.o.cmdheight = 2

-- A buffer becomes hidden when it is abandoned
vim.o.hid = true

-- Configure backspace so it acts as it should act
-- vim.o.backspace = eol,start,indent
-- TODO: This used to be an append, but nvim complains that it is nil no matter what...
	vim.o.whichwrap = "<",">","h","l"

-- Ignore case when searching
vim.o.ignorecase = true

-- When searching try to be smart about cases
vim.o.smartcase = true

-- Highlight search results
vim.o.hlsearch = true

-- Makes search act like search in modern browsers
vim.o.incsearch = true

-- Don't redraw while executing macros (good performance config)
vim.o.lazyredraw = true

-- For regular expressions turn magic on
vim.o.magic = true

-- Show matching brackets when text indicator is over them
vim.o.showmatch = true

-- How many tenths of a second to blink when matching brackets
vim.omat = 2

-- No annoying sound on errors
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.tm = 500

-- Add a bit extra margin to the left
vim.o.foldcolumn = "1"

---------------------------------------------------------------
---                    Colors and Fonts                     ---
---------------------------------------------------------------
-- Use Unix as the standard file type
vim.o.ffs = unix,dos,mac


---------------------------------------------------------------
---                 Files, backups and undo                 ---
---------------------------------------------------------------
-- Turn backup off, since most stuff is in SVN, git etc. anyway...
vim.o.backup = false
vim.o.writebackup = false
vim.o.wb = false
vim.o.swapfile = false


---------------------------------------------------------------
---              Text, tab and indent related               ---
---------------------------------------------------------------
-- Be smart when using tabs ;)
vim.o.smarttab = true

-- Linebreak on 500 characters
vim.o.lbr = true

-- Auto and smart indent and wrap lines, respectively
vim.o.ai = true
vim.o.si = true
vim.o.wrap = true


---------------------------------------------------------------
---         Moving around, tabs, windows and buffers        ---
---------------------------------------------------------------

-- Specify the behavior when switching between buffers
vim.o.switchbuf = useopen,usetab,newtab
vim.o.stal = 2


---------------------------------------------------------------
---   Turn persistent undo on means that you can undo even  ---
---   when you close a buffer/VIM                           ---
---------------------------------------------------------------
vim.o.undodir = "/Users/tylerbloom/.config/nvim/temp_dirs/undodir"
vim.o.undofile = true


------------------------------
-- => Shell section ---
------------------------------
vim.o.termguicolors = true


-- Stops the deletion of auto-indents if the auto-indented line is left blank
-- set cindent
vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.shiftround = true
-- FIXME: This was an append...
vim.o.cpoptions = "I"

-- Folding functions
vim.o.foldmethod = "expr"
-- FIXME: Dunno how to do this yet...
-- vim.o.foldexpr = nvim_treesitter#foldexpr()
-- Don't auto-fold on start up
vim.o.foldenable = false

vim.syntax = on


-- Change the working directory when a file is opened
vim.o.autochdir = true

vim.o.signcolumn = "yes"


vim.cmd([[let g:completion_enable_auto_popup=1]])
vim.cmd([[let g:completion_timer_cycle = 1]]) -- default value is 80
vim.cmd([[let g:completion_trigger_keyword_length = 2]]) -- default = 1

-- Completion
vim.o.completeopt = "menu", "menuone"

vim.cmd([[let g:formatdef_rustfmt = "rustfmt"]])
vim.cmd([[let g:formatters_rust = "rustfmt"]])


-- Add spaces after comment delimiters by default
vim.cmd([[let g:NERDSpaceDelims = 1]])

-- Use compact syntax for prettified multi-line comments
vim.cmd([[let g:NERDCompactSexyComs = 1]])

-- Align line-wise comment delimiters flush left instead of following code indentation
vim.cmd([[let g:NERDDefaultAlign = 'left']])

-- Set a language to use its alternate delimiters by default
vim.cmd([[let g:NERDAltDelims_cpp = 1]])

-- Add your own custom formats or override the defaults
vim.cmd([[let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }]])

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.cmd([[let g:NERDCommentEmptyLines = 1]])

-- Enable NERDCommenterToggle to check all selected lines is commented or not
vim.cmd([[let g:NERDToggleCheckAllLines = 1]])

vim.o.background = "dark"
vim.cmd([[let base16colorspace = 256]])
vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
vim.cmd([[hi Comment ctermfg=30 guifg=#64CBC8]])
vim.cmd([[hi Normal ctermbg=NONE guibg=NONE]])
vim.cmd([[hi Todo guibg=NONE ctermbg=NONE]])

-- Signature of Base16hi
-- function Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)

vim.cmd([[call Base16hi("LineNr", g:base16_gui04, "", g:base16_cterm04, "", "")]])

-- Brighter comments
vim.cmd([[call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")]])

-- Highlight currently argument
vim.cmd([[call Base16hi("LspSignatureActiveParameter", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold", "")]])

-- Error highlighting
vim.cmd([[call Base16hi("ErrorSignHL", "", "", g:base16_cterm08, g:base16_cterm01, "")]])
vim.cmd([[call Base16hi("WarnSignHL", "", "", g:base16_cterm0A, g:base16_cterm01, "")]])
vim.cmd([[call Base16hi("HintSignHL", "", "", g:base16_cterm0B, g:base16_cterm01, "")]])

vim.cmd([[sign define DiagnosticSignError text=** texthl=ErrorSignHL]])
vim.cmd([[sign define DiagnosticSignWarn text=++ texthl=WarnSignHl]])
vim.cmd([[sign define DiagnosticSignHint text=>> texthl=HintSignHl]])

vim.cmd([[hi clear DiagnosticError]])
vim.cmd([[hi clear DiagnosticVirtualTextWarn]])
vim.cmd([[hi clear DiagnosticWarn]])
vim.cmd([[hi clear DiagnosticVirtualTextError]])


vim.cmd([[hi DiagnosticError cterm=underline]])
vim.cmd([[call Base16hi("DiagnosticError", "", "", g:base16_cterm08, "", "" )]])
vim.cmd([[call Base16hi("DiagnosticWarn", "", "", g:base16_cterm0A, "", "" )]])
vim.cmd([[call Base16hi("DiagnosticHint", "", "", g:base16_cterm0B, "", "" )]])
vim.cmd([[call Base16hi("DiagnosticVirtualTextError", "", "", g:base16_cterm08, "", "" )]])
vim.cmd([[call Base16hi("DiagnosticVirtualTextWarning", "", "", g:base16_cterm0A, "", "" )]])
vim.cmd([[call Base16hi("DiagnosticVirtualTextHint", "", "", g:base16_cterm0A, "", "" )]])
vim.cmd([[hi LspInlayHint guifg=#b8bb26 guibg=#3c3836]])


-- Set @lsp.mod.documentation to guifg=#8ec07c (base0C)

function color()
				return string.format("#%s", vim.g.base16_gui0C)
end

local prefixed_00 = "#" .. vim.g.base16_gui00
local prefixed_01 = "#" .. vim.g.base16_gui01
local prefixed_02 = "#" .. vim.g.base16_gui02
local prefixed_03 = "#" .. vim.g.base16_gui03
local prefixed_04 = "#" .. vim.g.base16_gui04
local prefixed_05 = "#" .. vim.g.base16_gui05
local prefixed_06 = "#" .. vim.g.base16_gui06
local prefixed_07 = "#" .. vim.g.base16_gui07
local prefixed_08 = "#" .. vim.g.base16_gui08
local prefixed_09 = "#" .. vim.g.base16_gui09
local prefixed_0A = "#" .. vim.g.base16_gui0A
local prefixed_0B = "#" .. vim.g.base16_gui0B
local prefixed_0C = "#" .. vim.g.base16_gui0C
local prefixed_0D = "#" .. vim.g.base16_gui0D
local prefixed_0E = "#" .. vim.g.base16_gui0E
local prefixed_0F = "#" .. vim.g.base16_gui0F

vim.api.nvim_set_hl(0, '@lsp.type.parameter', { fg=prefixed_06 })
vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg=prefixed_06 })
vim.api.nvim_set_hl(0, '@lsp.type.namespace', { fg=prefixed_08 })
vim.api.nvim_set_hl(0, '@lsp.type.property', { fg=prefixed_06 })
vim.api.nvim_set_hl(0, '@lsp.mod.documentation', { fg=prefixed_0C })
vim.api.nvim_set_hl(0, '@lsp.type.macro', { fg=prefixed_08 })

-- Make some corrections to the coloring the semantic coloring can cause (probably want to adjust my LSP config too..)
-- Sourced from: https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
-- local links = {
--  ['@lsp.type.namespace'] = '@namespace',
--  ['@lsp.type.type'] = '@type',
--  ['@lsp.type.property'] = '@method',
--  ['@lsp.type.class'] = '@type',
--  ['@lsp.type.enum'] = '@type',
--  ['@lsp.type.interface'] = '@type',
--  ['@lsp.type.struct'] = '@structure',
--  ['@lsp.type.parameter'] = '@parameter',
--  ['@lsp.type.variable'] = '@variable',
--  ['@lsp.type.property'] = '@property',
--  ['@lsp.type.enumMember'] = '@constant',
--  ['@lsp.type.function'] = '@function',
--  ['@lsp.type.method'] = '@method',
--  ['@lsp.type.macro'] = '@macro',
--  ['@lsp.type.decorator'] = '@macro',
--  ['@lsp.mod.documentation'] = '@lsp.typemod.lifetime.declaration.rust',
--  ['@lsp.typemod.comment.documentation.rust'] = '@function',
--}
--for newgroup, oldgroup in pairs(links) do
--  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
--end

