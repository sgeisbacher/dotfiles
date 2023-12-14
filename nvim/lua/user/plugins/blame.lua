return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    require("gitblame").setup({
      enabled = false,
      message_template = "  <author> | <date> | <sha> <summary>",
      date_format = "%r",
    })
  end,
}
