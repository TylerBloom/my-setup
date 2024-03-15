
local telescope_opts = {
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

local fidget_opts = {
  -- Options related to LSP progress subsystem
  progress = {
    poll_rate = 0,                -- How and when to poll for progress messages
    suppress_on_insert = false,   -- Suppress new messages while in insert mode
    ignore_done_already = false,  -- Ignore new tasks that are already complete
    ignore_empty_message = false, -- Ignore new tasks that don't contain a message
    clear_on_detach =             -- Clear notification group when LSP server detaches
      function(client_id)
        local client = vim.lsp.get_client_by_id(client_id)
        return client and client.name or nil
      end,
    notification_group =          -- How to get a progress message's notification group key
      function(msg) return msg.lsp_client.name end,
    ignore = {},                  -- List of LSP servers to ignore

    -- Options related to how LSP progress messages are displayed as notifications
    display = {
      render_limit = 16,          -- How many LSP messages to show at once
      done_ttl = 3,               -- How long a message should persist after completion
      done_icon = "✔",            -- Icon shown when all LSP progress tasks are complete
      done_style = "Constant",    -- Highlight group for completed LSP tasks
      progress_ttl = math.huge,   -- How long a message should persist when in progress
      progress_icon =             -- Icon shown when LSP progress tasks are in progress
        { pattern = "pipe", period = 1 },
      progress_style =            -- Highlight group for in-progress LSP tasks
        "WarningMsg",
      group_style = "Title",      -- Highlight group for group name (LSP server name)
      icon_style = "Question",    -- Highlight group for group icons
      priority = 30,              -- Ordering priority for LSP notification group
      skip_history = true,        -- Whether progress notifications should be omitted from history
      format_annote =             -- How to format a progress annotation
        function(msg) return msg.title end,
      format_group_name =         -- How to format a progress notification group's name
        function(group) return tostring(group) end,
      overrides = {               -- Override options from the default notification config
        rust_analyzer = { name = "rust-analyzer" },
      },
    },

    -- Options related to Neovim's built-in LSP client
    lsp = {
      progress_ringbuf_size = 0,  -- Configure the nvim's LSP progress ring buffer size
      log_handler = false,        -- Log `$/progress` handler invocations (for debugging)
    },
  },

  -- Options related to notification subsystem
  notification = {
    poll_rate = 10,               -- How frequently to update and render notifications
    filter = vim.log.levels.INFO, -- Minimum notifications level
    history_size = 128,           -- Number of removed messages to retain in history
    override_vim_notify = false,  -- Automatically override vim.notify() with Fidget

    -- Options related to how notifications are rendered as text
    view = {
      stack_upwards = true,       -- Display notification items from bottom to top
      icon_separator = " ",       -- Separator between group name and icon
      group_separator = "---",    -- Separator between notification groups
      group_separator_hl =        -- Highlight group used for group separator
        "Comment",
      render_message =            -- How to render notification messages
        function(msg, cnt)
          return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
        end,
    },

    -- Options related to the notification window and buffer
    window = {
      winblend = 0,             -- Background color opacity in the notification window
      border = "none",            -- Border around the notification window
      zindex = 45,                -- Stacking priority of the notification window
      max_width = 45,              -- Maximum width of the notification window
      max_height = 0,             -- Maximum height of the notification window
      x_padding = 1,              -- Padding from right edge of window boundary
      y_padding = 0,              -- Padding from bottom edge of window boundary
      align = "bottom",           -- How to align the notification window
      relative = "editor",        -- What the notification window position is relative to
    },
  },
}

return {
  { 'ciaranm/securemodelines', lazy = true },
  { 'editorconfig/editorconfig-vim', lazy = true },
  { 'justinmk/vim-sneak', lazy = true },
  { 'machakann/vim-highlightedyank', lazy = true },
-- Plug 'wakatime/vim-wakatime'
  { 'nvim-treesitter/nvim-treesitter', lazy = true },

-- Themes
  { 'chriskempson/base16-vim' },

-- GUI enhancements
  { 'andymass/vim-matchup', lazy = true },
  { 'vim-airline/vim-airline', lazy = true },
  { 'vim-airline/vim-airline-themes', lazy = true },

-- NERDTree
  { 'scrooloose/nerdcommenter', lazy = true },

-- Telescope
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-telescope/telescope-file-browser.nvim', lazy = true },
  { 'nvim-telescope/telescope.nvim', opts = telescope_opts, tag = '0.1.5' },

-- highlight the current match in a different color
  { 'airblade/vim-current-search-match', lazy = true },

-- Autoformatter and tester
  { 'Chiel92/vim-autoformat', lazy = true },

-- General Langauge Support
  { 'neovim/nvim-lspconfig', lazy = true },
  { 'simrat39/inlay-hints.nvim', lazy = true },
  { 'simrat39/rust-tools.nvim', lazy = true },
  { 'nvim-lua/completion-nvim', lazy = true },
  { 'hrsh7th/cmp-nvim-lsp', branch = 'main', lazy = true },
  { 'hrsh7th/cmp-buffer', branch = 'main', lazy = true },
  { 'hrsh7th/nvim-cmp', branch = 'main', lazy = true },
  { 'ray-x/lsp_signature.nvim', lazy = true },
  { 'j-hui/fidget.nvim', opts = fidget_opts, branch = 'main', lazy = true },

-- Snippets
  { 'hrsh7th/cmp-vsnip', branch = 'main', lazy = true },
  { 'hrsh7th/vim-vsnip', lazy = true },

-- Specific Langauge Support
  { 'hdima/python-syntax', lazy = true },
  { 'lervag/vimtex', lazy = true },
  { 'cespare/vim-toml', branch = 'main', lazy = true },
  { 'stephpy/vim-yaml', lazy = true },
  { 'rust-lang/rust.vim', lazy = true },
  { 'rhysd/vim-clang-format', lazy = true },
  { 'dag/vim-fish', lazy = true },
  { 'godlygeek/tabular', lazy = true },

-- Pop-out terminal
  { 'akinsho/toggleterm.nvim', lazy = true },
}
