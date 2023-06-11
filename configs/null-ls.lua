local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- rust
  b.formatting.rustfmt,

  -- python

  b.formatting.black,
  b.diagnostics.mypy,
  b.diagnostics.ruff,
}

-- Enable formatting on save... delay of two seconds & supressed in insert mode
local last_save = 0
local on_attach = function(cli, buf)
  if cli.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = buf,
    }
    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertChange" }, {
      callback = function()
        last_save = os.time()
      end,
    })
    vim.api.nvim_create_autocmd({ "BufWrite", "BufWritePre", "BufWritePost", "BufLeave", "InsertLeave" }, {
      group = augroup,
      buffer = buf,
      callback = function()
        local this_save = os.time()
        if this_save - last_save > 2 then
          last_save = this_save
          vim.lsp.buf.format { bufnr = buf }
        end
      end,
    })
  end
end
-- :--

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}

local pp = {}
--1!:
