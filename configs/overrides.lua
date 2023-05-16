local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "c_sharp",
    "cpp"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint-lsp",
    "standardjs",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- c# stuff
    "csharp-language-server",
    "netcoredbg",

    -- rust stuff
    "rust-analyzer",
    "rustfmt",

    -- python stuff
    "autopep8",
    "pylint",
    "python-lsp-server",
    "pyright",
  },


}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
