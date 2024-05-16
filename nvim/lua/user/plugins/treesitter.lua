return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  dependencies = {
    "vrischmann/tree-sitter-templ",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "make",
        "prisma",
        "markdown",
        "regex",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "graphql",
        "templ",
      },
      sync_install = false,
      highlight = {
        enable = true,
        disable = { "go", "typescript" },
      },
      indent = { enable = true },
    })
  end,
}
