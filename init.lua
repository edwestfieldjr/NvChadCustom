local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- -- Auto-format on save -- DISABLED due to undo/redo performance issues
-- autocmd("BufWritePre", {
--   pattern = { "*", "<buffer>" },
--   command = "lua vim.lsp.buf.format()",
-- })

-- Load classic vim spell check
-- autocmd("BufEnter", {
--   pattern = { "<buffer>" },
--   command = "set spell spelllang=en_us",
-- })

autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "<buffer>" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})

-- Show the nvim-tree upon open
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



-- -- Fix null-ls/lsp formatter ('gq') issue:
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131#issuecomment-1457584752
-- autocmd('LspAttach', {
--   callback = function(args)
--     vim.bo[args.buf].formatexpr = nil
--   end,
-- })
-- -- Overall, Unnecessary:
