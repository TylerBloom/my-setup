-- Prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd({"BufRead"}, {
  pattern = {"*.orig", "*.pacnew"},
  command = "set readonly",
})

-- Leave paste mode when leaving insert mode
vim.api.nvim_create_autocmd({"InsertLeave"}, {
  pattern = {"*"},
  command = "set nopaste",
})

-- Follow Rust code style rules
vim.api.nvim_create_autocmd({"Filetype"}, {
  pattern = {"rust"},
  callback = function()
				vim.o.shiftwidth = 4
				vim.o.softtabstop = 4
				vim.o.tabstop = 4
				vim.o.expandtab = true
				vim.o.colorcolumn=100
  end,
})

-- Script plugins
-- TODO: There's a lot here...
-- autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

vim.api.nvim_create_autocmd({"BufWritePre"}, {
				pattern = { "*" },
				-- Clears extra whitespace at the end of lines
				callback = function()
								local save_cursor = vim.fn.getpos(".")
								local old_query = vim.fn.getreg('/')
								vim.cmd([[%s/\s\+$//e]])
								vim.fn.setpos('.', save_cursor)
								vim.fn.setreg('/', old_query)
				end
})

-- Startup actions
-- Saves and existing folds and loads old folds when a file is opened
local save_folds = vim.api.nvim_create_augroup('AutoSaveFolds', { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = save_folds,
  pattern = '.*',
  command = 'mkview',
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = save_folds,
  pattern = '.*',
  command = 'silence loadview',
})


vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
				pattern = "*",
				command = "checktime"
})

-- Return to last edit position when opening files (You want this!)
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("lazyvim_last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.cmd("norm zz")
    end
  end,
})
