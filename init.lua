local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Autimatically show nvim-tree file explorer on launch when opening file or buffer:
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


-- Fix null-ls/lsp formatter ('gq') issue:  
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131#issuecomment-1457584752
autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})
