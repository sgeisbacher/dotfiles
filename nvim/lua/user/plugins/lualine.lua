return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "powerline",
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        -- lualine_c = {{ "filename", path = 1 }},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
    })
  end,
}
