return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        -- dart = { "dartfmt" },
        css = { "prettier" },
        cs = { "csharpier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        terraform = { "terraformls" },
        templ = { "templ" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
      -- custom formatters
      -- example:
      formatters = {
        -- dartfmt = {
        --   command = "dart",
        --   args = function(ctx)
        --     return { "format" }
        --   end,
        --   stdin = true,
        --   post_hook = function(ctx)
        --     vim.cmd("edit!") -- force reload the file from disk
        --   end,
        -- },
        csharpier = {
          command = "csharpier",
          args = { "format", "--write-stdout" },
          stdin = true,
        },
      },
    })
  end,
}
