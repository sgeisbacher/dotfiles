return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = {} },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      event = "LspAttach",
      opts = {},
    },
    { "folke/neodev.nvim", opts = {} },
  },
  init = function()
    require("user.lsp")
  end,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "prettier",
        "terraformls",
      },
    })
  end,
}
