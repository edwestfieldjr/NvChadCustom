local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd({"BufNewFile", "BufWinEnter"}, {
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
