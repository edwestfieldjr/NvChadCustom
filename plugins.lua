local overrides = require("custom.configs.overrides")

local edit_events = { "TextChanged", "TextChangedI", "BufEnter", "BufLeave", "InsertEnter", "InsertChange", "InsertLeave" }


---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    -- lazy = false, -- override to ensure lsp automatically on startup
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

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
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
    'codota/tabnine-nvim',
    event = edit_events,
    -- lazy = false,
    config = function()
      require("tabnine").setup(
        {
          disable_auto_comment = true,
          -- accept_keymap = "<Tab>",
       accept_keymap = "<C-[>", -- Changed to avoid conflicts w/ default snippet plugins (nvim-cmp/LuaSnip)
       dismiss_keymap = "<C-]>",
       debounce_ms = 800,
       suggestion_color = { gui = "#808080", cterm = 244 },
       exclude_filetypes = { "TelescopePrompt" },
       log_file_path = nil, -- absolute path to Tabnine log file
      }
     )
    end,
    build = "./dl_binaries.sh",
  },

  -- installed by user on 2023-05-20: https://github.com/
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = false, -- already using nvim-tree
      view_options = {
        show_hidden = true,
      },
      float = {
        -- Padding around the floating window
        padding = 4,
        max_width = 100,
        max_height = 80,
      },
    },
    -- Optional dependencies
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(this)
      require("oil").setup(this.opts)
      vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })
    end,
    -- lazy = false,
    event = { "VeryLazy" },
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
