local overrides = require "custom.configs.overrides"

local edit_events =
  { "TextChanged", "TextChangedI", "BufEnter", "BufWinEnter", "BufLeave", "InsertEnter", "InsertChange", "InsertLeave" }

--@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    -- lazzy = false, -- override to ensure lsp automatically on startup lazy
    event = edit_events, -- override to ensure lsp automatically on new/open file
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        -- lazy = false, -- override 2023-05-22
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "f3fora/cmp-spell",
  --   },
  --   opts = overrides.cmp,
  -- },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = overrides.colorizer,
  },

  ----------------------------------------------------------------
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- installed by user on 2023-05-16: https://github.com/
  {
    "Pocco81/auto-save.nvim",
    cmd = { "ASToggle" },
    -- lazy = false,
    event = edit_events,
    config = function()
      require("auto-save").setup()
    end,
  },

  -- installed by user on 2023-05-16: https://github.com/codota/tabnine-nvim
  {
    "codota/tabnine-nvim",
    event = edit_events,
    -- lazy = false,
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<M-Tab>",
        dismiss_keymap = "<M-Esc>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
    build = "./dl_binaries.sh",
  },

  -- installed by user on 2023-05-20: https://github.com/stevearc/oil.nvim
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 4,
        max_width = 100,
        max_height = 80,
      },
    },
    init = function()
      vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open Oil (press '-' again for parent dir)" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(this)
      require("oil").setup(this.opts)
    end,
  },

  -- installed by user on 2023-05-29: https://github.com/mg979/vim-visual-multi
  {
    "mg979/vim-visual-multi",
    event = edit_events,
    init = function()
      vim.cmd "let g:VM_maps = {}"
      vim.cmd "let g:VM_maps['Find Under'] = '<C-l>'"
      vim.cmd "let g:VM_maps['Find Subword Under'] = '<C-l>'"
    end,
    --      override to ensure lsp automatically on new/open file
  },

  -- installed by user on 2023-05-30: https://github.com/barrett-ruth/live-server.nvim
  {
    "barrett-ruth/live-server.nvim",
    build = "npm i -g live-server",
    ft = { "html", "css", "javascript" },
    init = function()
      vim.keymap.set("n", "=", ":LiveServerStart<CR>", { desc = "Start Live Server" })
      vim.keymap.set("n", "<C-=>", ":LiveServerStop<CR>", { desc = "Stop Live Server" })
    end,
    config = function()
      require("live-server").setup()
    end,
  },

  ----------------------------------------------------------------
  -- Development plugins

  -- T/B/A

  ----------------------------------------------------------------

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
