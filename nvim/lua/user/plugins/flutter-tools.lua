return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  opts = {
    fvm = true,
    dev_log = {
      open_cmd = "tabedit",
    },
    lsp = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
      settings = {
        lineLength = 120,
      },
    },
  },
}
