return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "python",
        "rust",
        "scss",
        "tsx",
        "typescript",
        "vue",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        emmet_language_server = {
          filetypes = {
            "css",
            "html",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "typescriptreact",
            "vue",
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "biome",
        "clang-format",
        "clangd",
        "css-lsp",
        "emmet-language-server",
        "gopls",
        "google-java-format",
        "html-lsp",
        "jdtls",
        "json-lsp",
        "marksman",
        "pyright",
        "ruff",
        "rust-analyzer",
        "vtsls",
        "vue-language-server",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        java = { "google-java-format" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
    },
  },
}
