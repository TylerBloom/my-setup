
" About
"  (Neo)Vim users will debate endlessly about the 'best' setup.  I find this
"  dumb.  Ultimately, the best setup is one that works for you, and this works
"  for me.  If you can find some use in it, fantastic.
"
"  The TL;DR on my setup philosophy is that want new features to work behind
"  the scenes or prompt me.  If I have to remember a new set of commands or
"  keystrokes, the likelihood that I will use that feature are deduced
"  greatly.
"
"  Most shortcuts that I add use the '<leader>'.  Things that I use with great
"  frequence are shortcut this way (formatting, running specific tests,
"  switching between open files, etc).
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shell=/bin/bash
" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin indent on

set number
set relativenumber

set title

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Visual mode with mouse
set mouse=a
set mousemodel=extend

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 3 lines to the cursor - when moving vertically using j/k
set so=3

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl+h to stop searching
vnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>/ :nohlsearch<cr>

" See whitespace
nnoremap <leader>, :set invlist<cr>

" Move by line
nnoremap j gj
nnoremap k gk

" Close the current buffer
map <leader>b :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>B :bufdo bd<cr>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif

" Quick paste from clipboard
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>y "+yy
vmap <leader>y "+y

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" Keymap for replacing up to next _ or -
map <leader>m t_

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Change the working directory when a file is opened
set autochdir

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


""" The below is from other sources

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Make "this word" searches very magic too for easy re-lookups
nnoremap * /\v<<C-R>=expand('<cword>')<CR>><CR>
nnoremap # ?\v<<C-R>=expand('<cword>')<CR>><CR>

" Stops the deletion of auto-indents if the auto-indented line is left blank
" set cindent
set tabstop=2
set autoindent
set copyindent
set shiftround
set cpoptions+=I

" Folding functions
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable " Don't auto-fold on start up
nnoremap <silent> <leader>u zc
nnoremap <silent> <leader>U zC
nnoremap <silent> <leader>o zO
nnoremap <silent> <leader>O zo

" Visual Mode mappings
" Normally, pasting something while in visual mode will replace what is in
" that register with what is highlighted. This stops that.
xnoremap <expr> p '"_d"'.v:register.'P'
xnoremap <expr> P '"_d"'.v:register.'P'


" Insert mode mapppings
" Normally, adding '#' as the first char to an indented line will remove the
" indentation. This stops that.
inoremap # X#
" Normally, pressing enter on an empty line will remove the auto-indention.
" This stops that.
" inoremap <cr> <space><bs><cr>

" Intuitive remaps for j, k on line that wrap around
nnoremap j gj
nnoremap k gk

" Allow ; to be used to start a command
nnoremap ; :

syntax on

" Death to the arrow keys...
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Jump to start and end of line using the home row keys
nmap H ^
nmap L $
vmap H ^
vmap L $

" Ctrl+j and Ctrl+k as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>


" Startup actions
" Saves and existing folds and loads old folds when a file is opened
augroup AutoSaveFolds
  autocmd!
  au BufWinLeave .* mkview
  au BufWinEnter .* silent loadview
augroup END

call plug#begin("~/.config/nvim/plugged")

" Load plugins
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'wakatime/vim-wakatime'
Plug 'nvim-treesitter/nvim-treesitter'

" Themes
Plug 'chriskempson/base16-vim'

" GUI enhancements
Plug 'andymass/vim-matchup'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'scrooloose/nerdcommenter'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" highlight the current match in a different color
Plug 'airblade/vim-current-search-match'

" Autoformatter and tester
Plug 'Chiel92/vim-autoformat'

" General Langauge Support
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/inlay-hints.nvim' " Minor Rust analyzer support (inlayed hints)
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch':'main'}
Plug 'hrsh7th/cmp-buffer', {'branch':'main'}
Plug 'hrsh7th/nvim-cmp', {'branch':'main'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'j-hui/fidget.nvim', {'branch':'main'}

" Snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Specific Langauge Support
Plug 'hdima/python-syntax'
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml', {'branch':'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'

" Pop-out terminal
Plug 'akinsho/toggleterm.nvim'

call plug#end()

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
let g:completion_enable_auto_popup=1
let g:completion_timer_cycle = 1 "default value is 80
let g:completion_trigger_keyword_length = 2 " default = 1

" Completion
set completeopt=menu,menuone
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" !!!-------------------- Autoformat Config --------------------!!!
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

noremap <leader>f :Autoformat<CR>
noremap <leader>T :RustTest<CR>

" !!!------------------ NERD Commenter Config -------------------!!!
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

set signcolumn=yes

" !!!------------------ Telescope Config -------------------!!!
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope file_browser initial_mode=normal<cr>
nnoremap <leader>fg <cmd>Telescope live_grep initial_mode=insert<cr>
nnoremap <leader>fb <cmd>Telescope buffers initial_mode=normal<cr>
nnoremap <silent> <leader>t <cmd>Telescope lsp_document_symbols initial_mode=normal<CR>

" !!!------------------ Color Scheme Config -------------------!!!
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
hi Comment ctermfg=30 guifg=#64CBC8
hi Normal ctermbg=NONE guibg=NONE
hi todo ctermbg=NONE

" Brighter comments
call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

" Highlight currently argument
call Base16hi("LspSignatureActiveParameter", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold", "")

" !!!------------------ LSP Config ----------------------------!!!

" Goto mappings
nnoremap <silent> <leader>g <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>G <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>r <cmd>Telescope lsp_references initial_mode=normal<CR>
nnoremap <silent> <leader>& <cmd>Telescope lsp_references initial_mode=normal<CR>
"nnoremap <silent> <leader>i <cmd>Telescope lsp_implementations initial_mode=normal<CR>

" Error mappings
nnoremap <silent> <leader>eh <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>el <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>ee  <cmd>lua vim.diagnostic.open_float(0, {scope="cursor"})<CR>
nnoremap <silent> <leader>E  <cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>
nnoremap <silent> <leader>e <cmd>Telescope diagnostics severity_limit=1 initial_mode=normal<CR>

" Misc mappings
nnoremap <silent> <leader>R <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.format( { async = true } )<CR>
nnoremap <silent> <leader>i <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>C <cmd>lua require'rust-tools'.open_cargo_toml.open_cargo_toml()<CR>
nnoremap <silent> <leader>c <cmd>cd ..<CR>
" I would like to be able to change the working directory to src/
" nnoremap <silent> <leader><C-c> <cmd>cd ..<CR>

" Error highlighting
call Base16hi("ErrorSignHL", "", "", g:base16_cterm08, g:base16_cterm01, "")
call Base16hi("WarnSignHL", "", "", g:base16_cterm0A, g:base16_cterm01, "")
call Base16hi("HintSignHL", "", "", g:base16_cterm0B, g:base16_cterm01, "")

sign define DiagnosticSignError text=** texthl=ErrorSignHL
sign define DiagnosticSignWarn text=++ texthl=WarnSignHl
sign define DiagnosticSignHint text=>> texthl=HintSignHl

highlight clear DiagnosticError
highlight clear DiagnosticVirtualTextWarn
highlight clear DiagnosticWarn
highlight clear DiagnosticVirtualTextError

""function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
highlight DiagnosticError cterm=underline
call Base16hi("DiagnosticError", "", "", g:base16_cterm08, "", "" )
call Base16hi("DiagnosticWarn", "", "", g:base16_cterm0A, "", "" )
call Base16hi("DiagnosticHint", "", "", g:base16_cterm0B, "", "" )
call Base16hi("DiagnosticVirtualTextError", "", "", g:base16_cterm08, "", "" )
call Base16hi("DiagnosticVirtualTextWarning", "", "", g:base16_cterm0A, "", "" )
call Base16hi("DiagnosticVirtualTextHint", "", "", g:base16_cterm0A, "", "" )

"

" LSP configuration & Config for toggleterm
nnoremap <silent> <leader>t <cmd>ToggleTerm<CR>

set shell=fish

lua << END
local cmp = require'cmp'
local lspconfig = require('lspconfig')
local toggleterm = require'toggleterm'

toggleterm.setup({
	  size = 20,
	  shell=fish,
	  open_mapping = [[<a-t>]],
	  hide_numbers = true,
	  shade_terminals = true,
	  shading_factor = 2,
	  start_in_insert = true,
	  insert_mappings = true,
	  persist_size = true,
	  direction = "float",
	  close_on_exit = true,
	  shell = vim.o.shell,
	  float_opts = {
      width = 130,
	  	border = "single",
  	},
})


local servers = { "rust_analyzer" }
cmp.setup({
  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    -- TODO: currently snippets from lsp end up getting prioritized -- stop that!
    { name = 'nvim_lsp' },
  }, {
    { name = 'path' },
  }),
  experimental = {
    ghost_text = true,
  },
})


--- Inlayed hints ---
require("rust-tools").setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<space>p", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
  },
  tools = {
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      auto = true,

      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = false,

      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = " >> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = true,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
    },
  },


})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

	buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>', opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
      	command = "clippy"
			},
      cargo = {
        allFeatures = false,
      },
      inlayHints = {
      	chainingHints = {
      	  enable = true,
				}
			},
      completion = {
	      postfix = {
	        enable = false,
	      },
      },
    },
  },
  capabilities = capabilities,
}

require"fidget".setup{
{
  text = {
    spinner = "pipe",         -- animation shown when tasks are ongoing
    done = "✔",               -- character shown when all tasks are complete
    commenced = "Started",    -- message shown when task starts
    completed = "Completed",  -- message shown when task completes
  },
  align = {
    bottom = false,            -- align fidgets along bottom edge of buffer
    right = true,             -- align fidgets along right edge of buffer
  },
  timer = {
    spinner_rate = 125,       -- frame rate of spinner animation, in ms
    fidget_decay = 2000,      -- how long to keep around empty fidget, in ms
    task_decay = 1000,        -- how long to keep around completed task, in ms
  },
  fmt = {
    leftpad = true,           -- right-justify text in fidget box
    stack_upwards = true,     -- list of tasks grows upwards
    fidget =                  -- function to format fidget title
      function(fidget_name, spinner)
        return string.format("%s %s", spinner, fidget_name)
      end,
    task =                    -- function to format each task line
      function(task_name, message, percentage)
        return string.format(
          "%s%s [%s]",
          message,
          percentage and string.format(" (%s%%)", percentage) or "",
          task_name
        )
      end,
  },
}
}

require("telescope").setup {
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
END

autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'nvim_lua' },
\     { name = 'buffer' },
\   },
\ }

" =============================================================================
" # Footer
" =============================================================================

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif
