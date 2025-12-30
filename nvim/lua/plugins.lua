
local toggleterm_opts = {
	  size = 20,
	  shell = "fish",
	  open_mapping = [[<a-t>]],
	  hide_numbers = true,
	  shade_terminals = true,
	  shading_factor = 2,
	  start_in_insert = true,
	  insert_mappings = true,
	  persist_size = true,
	  direction = "float",
	  close_on_exit = true,
	  float_opts = {
      width = 130,
	  	border = "single",
  	},
}

local telescope_opts = {
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

return {
  { 'justinmk/vim-sneak' },
  { 'machakann/vim-highlightedyank' },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'nvim-treesitter/nvim-treesitter', lazy = true },

-- Themes
  { 'chriskempson/base16-vim' },

-- GUI enhancements
  { 'andymass/vim-matchup', lazy = true },
  { 'vim-airline/vim-airline' },
  { 'vim-airline/vim-airline-themes' },

-- NERDTree
  { 'scrooloose/nerdcommenter' },

-- Telescope
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope.nvim', opts = telescope_opts, tag = '0.1.5' },

-- highlight the current match in a different color
  { 'airblade/vim-current-search-match' },

-- General Langauge Support
  { 'jparise/vim-graphql' },
  { 'neovim/nvim-lspconfig' },
  { 'simrat39/inlay-hints.nvim' },
  { 'mrcjkb/rustaceanvim', version = "^4", ft = { "rust" }, lazy = false },
  { 'nvim-lua/completion-nvim' },
  { 'hrsh7th/cmp-nvim-lsp', branch = 'main' },
  { 'hrsh7th/cmp-buffer', branch = 'main' },
  { 'hrsh7th/nvim-cmp', branch = 'main' },
  { 'ray-x/lsp_signature.nvim', lazy = true },
  { 'j-hui/fidget.nvim', branch = 'main', tag = 'v1.4.0' },

-- Snippets
  { 'hrsh7th/cmp-vsnip', branch = 'main' },
  { 'hrsh7th/vim-vsnip' },

-- Specific Langauge Support
  { 'hdima/python-syntax', lazy = true },
  { 'lervag/vimtex', lazy = true },
  { 'cespare/vim-toml', branch = 'main', lazy = true },
  { 'stephpy/vim-yaml', lazy = true },
  { 'rust-lang/rust.vim', lazy = true },
  { 'rhysd/vim-clang-format', lazy = true },
  { 'dag/vim-fish', lazy = true },
  { 'godlygeek/tabular', lazy = true },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

-- Pop-out terminal
  { 'akinsho/toggleterm.nvim', opts = toggleterm_opts },
}
