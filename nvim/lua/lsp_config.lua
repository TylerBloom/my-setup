local cmp = require('cmp')
local lspconfig = require('lspconfig')
local toggleterm = require('toggleterm')


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

require("rustaceanvim")
vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      	inlayHints = {
								chainingHints = { enable = true },
								typeHints = { enable = false },
								parameterHints = { enable = false },
								bindingModeHints = { enable = false },
								closingBraceHints = { enable = false },
								closureCaptureHints = { enable = false },
				},
      	check = {
      	    workspace = false,
				},
      	cargo = {
      	    allFeatures = true,
      	    targetDir = true,
      	    extraEnv = {
      	    		['CARGO_TARGET_DIR'] = "/home/parallels/.cargo/ra_target"
						}
				},
      },
    },
  },
  tools = {
    on_initialized = function()
   	  vim.lsp.inlay_hint.enable(true)
    end,
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      auto = false,

      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = true,

      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = " >> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = true,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
    },
  },
}

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
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

  -- Mappings.
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>', opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end


-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   settings = {
--     ["rust-analyzer"] = {
--       checkOnSave = {
--       	command = "clippy"
-- 			},
--       cargo = {
--         allFeatures = false,
--       },
--       inlayHints = {
--       	chainingHints = {
--       	  enable = true,
-- 				}
-- 			},
--       completion = {
-- 	      postfix = {
-- 	        enable = false,
-- 	      },
--       },
--     },
--   },
--   capabilities = capabilities,
-- }

require"fidget".setup{
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
      format_message =            -- How to format a progress message
        require("fidget.progress.display").default_format_message,
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
    configs =                     -- How to configure notification groups when instantiated
      { default = require("fidget.notification").default_config },
    redirect =                    -- Conditionally redirect notifications to another backend
      function(msg, level, opts)
        if opts and opts.on_open then
          return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
        end
      end,

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
