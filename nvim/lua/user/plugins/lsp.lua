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

    -- see available list https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    require("mason-tool-installer").setup({
      ensure_installed = {
        "dart-debug-adapter",
        "ts_ls",
        "stylua",
        "prettier",
        "terraformls",
        "templ",
        "zls",
      },
    })
  end,
}
