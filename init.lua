local autocmd = vim.api.nvim_create_autocmd

-- Automatically show the nvim-tree file explorer on launch when opening file or buffer:
-- https://github.com/nvim-tree/nvim-tree.lua/discussions/1517#discussion-4317419
autocmd({ "BufNewFile", "BufWinEnter" }, {
  callback = function(args)
    if vim.fn.expand "%:p" ~= "" then
      vim.api.nvim_del_autocmd(args.id)
      vim.cmd "NvimTreeToggle"
      vim.schedule(function()
        vim.cmd "wincmd p"
      end)
    end
  end,
})

