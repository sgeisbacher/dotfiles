return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    { "leoluz/nvim-dap-go", opts = {} },
  },
  opts = function()
    local dap = require("dap")

    dap.adapters.dart = {
      type = "executable",
      command = "dart",
      args = { "debug_adapter" },
    }

    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Dart Program",
        program = "${file}", -- Debug the current file
        cwd = "${workspaceFolder}",
      },
      {
        type = "dart",
        request = "attach",
        name = "Attach to Dart Process",
        observatoryUri = function()
          return vim.fn.input("Observatory URI: ")
        end,
      },
    }
  end,
}
