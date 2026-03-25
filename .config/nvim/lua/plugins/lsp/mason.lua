return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "lua_ls",
        "pyright",
        "clangd",         -- C++
        "rust_analyzer",   -- Rust
        "astro",          -- Astro
        "eslint",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier",       -- Web formatter (HTML/CSS/Astro)
        "stylua",         -- Lua formatter
        "isort",          -- Python import sorter
        "black",          -- Python formatter
        "clang-format",   -- C++ formatter
        -- Note: Rust uses 'rustfmt' which usually comes with your rust toolchain
        "pylint",
        "eslint_d",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
