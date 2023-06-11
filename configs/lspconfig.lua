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
    name = "denols",
  },
  {
    name = "clangd",
  },
  {
    name = "pyright",
  },
  {
    name = "pylsp",
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "W391" },
            maxLineLength = 100,
          },
        },
      },
    },
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

for _, lsp in ipairs(servers) do
  lspconfig[lsp.name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = lsp.settings or {},
  }
end
