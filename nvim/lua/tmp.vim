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


autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'nvim_lua' },
\     { name = 'buffer' },
\   },
\ }
