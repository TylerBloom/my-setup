-- With a map leader it's possible to do extra key combinations like <leader>w
-- saves the current file
vim.g.mapleader = " "

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
require('lazy').setup('plugins')

-- Other settings
require('mappings')
require('autocmd')
require('general')
require('lsp_config')
