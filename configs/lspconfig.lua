local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  {
    name = "html",
  },
  {
    name = "cssls",
  },
  {
    name = "tsserver",
  },
  {
    name = "clangd",
  },
  {
    name = "pyright",
  },
  {
    name = "csharp_ls",
  },
  {
    name = "jsonls",
  },
  {
    name = "tailwindcss",
  },
  {
    name = "textlsp",
  },
  {
    name = "gopls",
  },
  {
    name = "jdtls",
  },
  {
    name = "zls",
  },
  {
    name = "sqlls",
  },
  {
    name = "rust_analyzer",
    settings = {
      ["rust-analyzer"] = {},
    },
  },
}

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for _, lsp in ipairs(servers) do
  if lsp.settings then
    opts.settings = lsp.settings
  end
  lspconfig[lsp.name].setup(opts)
end
