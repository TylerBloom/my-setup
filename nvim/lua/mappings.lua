
vim.api.nvim_set_keymap('', '<leader>p', '"+p' , { noremap = true })
vim.api.nvim_set_keymap('', '<leader>P', '"+P' , { noremap = true })
vim.api.nvim_set_keymap('', '<leader>y', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('', '<leader>d', '"+dd', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y' , { })
vim.api.nvim_set_keymap('n', '<leader>yw', '"+yw' , { })
vim.api.nvim_set_keymap('v', '<leader>d', '"+d' , { })

-- In other versions of nvim, cw doesn't consume whitespace. I prefer that behavior
vim.api.nvim_set_keymap('n', 'cw', 'ce', { })
vim.api.nvim_set_keymap('n', 'dw', 'de', { })

-- nmap <leader>w :w!<cr>
-- Ctrl+h to stop searching
vim.api.nvim_set_keymap('v', '<leader>/', ':nohlsearch<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<cr>', { noremap = true })


---------------------------------------------------------------
---                      Spell checking                     ---
---------------------------------------------------------------
-- Pressing ,ss will toggle and untoggle spell checking
vim.api.nvim_set_keymap('', '<leader>ss', ':setlocal spell!<cr>', { })

-- Shortcuts using <leader>
-- map <leader>sn ]s
-- map <leader>sp [s
-- map <leader>sa zg
-- map <leader>s? z=



---------------------------------------------------------------
---                          Misc                           ---
---------------------------------------------------------------
-- Remove the Windows ^M - when the encodings gets messed up
vim.api.nvim_set_keymap('', '<leader>m', "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm", { noremap = true } )

-- <leader>, shows/hides hidden characters
vim.api.nvim_set_keymap('n', '<leader>,', ':set invlist<cr>', { noremap = true })

-- Keymap for replacing up to next _ or -
vim.api.nvim_set_keymap('', '<leader>m', 't_', { })

-- I can type :help on my own, thanks.
vim.api.nvim_set_keymap('', '<F1>', '<Esc>', { })
vim.api.nvim_set_keymap('i', '<F1>', '<Esc>', { })

---------------------------------------------------------------
---                     Editing mappings                    ---
---------------------------------------------------------------
-- Remap VIM 0 to first non-blank character
-- Mappings that need to be moved...
vim.api.nvim_set_keymap('', '0', '^', { })

---------------------------------------------------------------
---                   Visual mode related                   ---
---------------------------------------------------------------
-- Visual mode pressing * or # searches for the current selection Super useful!
-- From an idea by Michael Naumann
vim.api.nvim_set_keymap('v', '*', ":lua VisualSelection('')<CR>/<C-R>=@/<CR><CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '#', ":lua VisualSelection('')<CR>?<C-R>=@/<CR><CR>", { noremap = true, silent = true })

function VisualSelection(direction)
				local saved_reg = vim.api.nvim_exec([[echo getreg('"')]], true)

				vim.cmd('normal! vgvy')
				local pattern = vim.api.nvim_exec([[echo getreg('"')]], true)

				if direction == 'gv'
				then
								vim.cmd("Ack '" .. pattern .. "' " )
				elseif direction == 'replace'then
								vim.cmd("%s" .. '/' .. pattern .. '/')
				end

				-- Clears the last search pattern
				vim.cmd([[let @/ = "]] .. pattern .. [["]])
				vim.cmd([[let @" = "]] .. saved_reg .. [["]])
end

-- See whitespace
vim.api.nvim_set_keymap('n', '<leader>,', ':set invlist<cr>', { noremap = true })

-- Move by line
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Close the current buffer
vim.api.nvim_set_keymap('', '<leader>b', ':Bclose<cr>:tabclose<cr>gT', { })

-- Close all the buffers
vim.api.nvim_set_keymap('', '<leader>B :bufdo', 'bd<cr>', { })

-- <leader><leader> toggles between buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true })
vim.api.nvim_set_keymap('', '<leader>l', ':bnext<cr>', { })
vim.api.nvim_set_keymap('', '<leader>h', ':bprevious<cr>', { })

-- Search results centered please
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })

-- Very magic by default
vim.api.nvim_set_keymap('n', '?', '?\\v', { noremap = true })
vim.api.nvim_set_keymap('n', '/', '/\\v', { noremap = true })
vim.api.nvim_set_keymap('c', '%s/', '%sm/', { noremap = true })

-- Make "this word" searches very magic too for easy re-lookups
vim.api.nvim_set_keymap('n', '*', "/\\v<<C-R>=expand('<cword>')<CR>><CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '#', "?\\v<<C-R>=expand('<cword>')<CR>><CR>", { noremap = true })

-- Folding
vim.api.nvim_set_keymap('n', '<leader>u', 'zc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>U', 'zC', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', 'zO', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>O', 'zo', { noremap = true, silent = true })

-- Visual Mode mappings
-- Normally, pasting something while in visual mode will replace what is in
-- that register with what is highlighted. This stops that.
-- vim.api.nvim_set_keymap('x', 'p', "\"_d\"'.v:register.'P'", { noremap = true, expr = true })
-- vim.api.nvim_set_keymap('x', 'P', "\"_d\"'.v:register.'P'", { noremap = true, expr = true })

-- xnoremap <expr> p '"_d"'.v:register.'P'
-- xnoremap <expr> P '"_d"'.v:register.'P'
-- "_d"XP

-- Insert mode mapppings
-- Normally, adding '#' as the first char to an indented line will remove the
-- indentation. This stops that.
vim.api.nvim_set_keymap('i', '#', 'X#', { noremap = true })
-- Normally, pressing enter on an empty line will remove the auto-indention.
-- This stops that.
-- inoremap <cr> <space><bs><cr>

-- Intuitive remaps for j, k on line that wrap around
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Allow ; to be used to start a command
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- Death to the arrow keys...
vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('', '<Right>', '<NOP>', { noremap = true })

-- Jump to start and end of line using the home row keys
vim.api.nvim_set_keymap('', 'H', '^', { })
vim.api.nvim_set_keymap('', 'L', '$', { })
vim.api.nvim_set_keymap('v', 'H', '^', { })
vim.api.nvim_set_keymap('v', 'L', '$', { })

-- Ctrl+j and Ctrl+k as Esc
-- Ctrl-j is a little awkward unfortunately:
-- https://github.com/neovim/neovim/issues/5916
-- So we also map Ctrl+k
vim.api.nvim_set_keymap('n', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('s', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('x', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-j>', '<C-c>', { noremap = true })
vim.api.nvim_set_keymap('o', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('l', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<Esc>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('s', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('x', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<C-c>', { noremap = true })
vim.api.nvim_set_keymap('o', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('l', '<C-k>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<Esc>', { noremap = true })


-- Mappings that need to be moved...
-- nmap <leader>w :w!<cr>
-- Ctrl+h to stop searching
vim.api.nvim_set_keymap('v', '<leader>/', ':nohlsearch<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<cr>', { noremap = true })

vim.api.nvim_set_keymap('i', "<TAB>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', "<S-TAB>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })

vim.api.nvim_set_keymap('', "<leader>f", ":Autoformat<CR>", { noremap = true})
vim.api.nvim_set_keymap('', "<leader>T", ":RustTest<CR>", { noremap = true})


-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope file_browser initial_mode=normal<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep initial_mode=insert<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers initial_mode=normal<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope lsp_document_symbols initial_mode=normal<CR>', { noremap = true, silent = true })


-- !!!------------------ LSP Config ----------------------------!!!

-- Goto mappings
vim.api.nvim_set_keymap('n', '<leader>g', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>G', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>Telescope lsp_references initial_mode=normal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>&', '<cmd>Telescope lsp_references initial_mode=normal<CR>', { noremap = true, silent = true })
-- nnoremap <silent> <leader>i <cmd>Telescope lsp_implementations initial_mode=normal<CR>

-- Error mappings
vim.api.nvim_set_keymap('n', '<leader>eh', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>el', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>E', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Telescope diagnostics severity_limit=1 initial_mode=normal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ee', '<cmd>Telescope diagnostics severity_limit=2 initial_mode=normal<CR>', { noremap = true, silent = true })

-- Misc mappings
vim.api.nvim_set_keymap('n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format( { async = true } )<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>C', "<cmd>RustLsp openCargo<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>cd ..<CR>', { noremap = true, silent = true })

-- Comment out the selection
-- vim.api.nvim_set_keymap('v', '<leader>,', ':s/\\(.*\\)/\\/\\/ \\1/<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<leader>.', ':s/\\(\\s*\\)\\(.*\\)/\\1\\/\\/\\2/<CR>:nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>c', ':s/\\(\\s*\\)\\(.*\\)/\\1\\/\\/\\2/<CR>:nohlsearch<CR>', { noremap = true, silent = true })


-- LSP configuration & Config for toggleterm
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>', { noremap = true, silent = true})
