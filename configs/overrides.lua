local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "java",
    "javascript",
    "jsdoc",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "c_sharp",
    "cpp",
    "zig",
    "sql",
    "ocaml",
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
    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint-lsp",
    "standardjs",
    "tailwindcss-language-server",

    -- c/cpp
    "clangd",
    "clang-format",

    -- c#
    "csharp-language-server",
    "netcoredbg",

    -- java
    "jdtls",

    -- rust
    "rust-analyzer",
    "rustfmt",

    -- python
    "pyright",
    "mypy",
    "ruff",
    "black",
    "debugpy",

    -- golang
    "gopls",

    -- zig
    "zls",

    -- sql
    "sqlls",

    --text files
    "grammarly-languageserver",

    --ocaml
    "ocaml-lsp",
    "ocamlformat",
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

  view = {
    width = 25,
  },
}

-- colorizer

M.colorizer = {
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = "background", -- Set the display mode.
    -- Available methods are false / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = true, -- Enable tailwind colors
    -- parsers can contain values used in |user_default_options|
    sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
    virtualtext = "■",
    -- update color values even if buffer is not focused
    -- example use: cmp_menu, cmp_docs
    always_update = true,
  },
}

--
-- M.cmp = {
--   sources = {
--     {
--       name = "spell",
--       option = {
--         keep_all_entries = false,
--         enable_in_context = function()
--           return true
--         end,
--       },
--     },
--   },
-- }

return M
