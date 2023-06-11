---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },

    -- added by user 2023-05-23: VSCode-style copy & move lines...
    ["<A-k>"] = { ":m .-2<CR>==", "Move line up" },
    ["<A-j>"] = { ":m .+1<CR>==", "Move line down" },
    ["<A-l>"] = { "yyp", "Duplicate line" },
  },
  v = {
    -- ... and same for blocks
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move block up" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move block down" },
    ["<A-l>"] = { "Vy0P", "Duplicate block" },
    --
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "Debug Python",
    },
  },
}

return M
