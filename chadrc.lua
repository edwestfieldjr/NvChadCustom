---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "yoru",
  theme_toggle = { "yoru", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- statusline = {
  -- theme = "minimal", -- default/vscode/vscode_colored/minimal
  --   -- default/round/block/arrow separators work only for default statusline theme
  --   -- round and block will work for minimal theme only
  --   separator_style = "round",
  --   overriden_modules = function()
  --     return strftime('%c')
  --   end,
  -- },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = false,
    overriden_modules = function()
      local modules = require "nvchad_ui.tabufline.modules"
      return {
        buttons = function()
          return modules.buttons() .. ""-- TBD: Insert a Display Clock Function
        end,
      }
     end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- override lazy.nvim default configs
M.lazy_nvim = require "custom.configs.lazy_nvim"

return M
