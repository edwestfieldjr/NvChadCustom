---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  nvdash = {
    load_on_startup = true,
    header = {
      "01010100 01101000 01101001 01110011 ",
      "00100000 01110100 01101111 01101111 ",
      "00100000 01110011 01101000 01100001 ",
      "01101100 01101100 00100000 01110000 ",
      "01100001 01110011 01110011 00101110 ",
      "00101110 00101110 01011100 00110000 ",
    },
  },

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
