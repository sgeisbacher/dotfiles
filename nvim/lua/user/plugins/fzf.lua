return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { { "junegunn/fzf", build = "./install --bin" } },
  config = function()
    require("fzf-lua").setup({'fzf-vim'})
  end,
  opts = {}
}
