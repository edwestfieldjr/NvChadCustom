---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = false,
    overriden_modules = function()
      local modules = require "nvchad_ui.tabufline.modules"
      return {
        buttons = function()
          return modules.buttons() .. "" -- TBD: Insert a Display Clock Function
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
