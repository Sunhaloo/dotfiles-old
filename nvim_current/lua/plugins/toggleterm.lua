return {
  {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = function()
          require("toggleterm").setup({
              -- size = 20,
              size = 13,
              open_mapping = [[<c-/>]],
              hide_numbers = true,
              -- direction = "float",
              direction = "horizontal",
              close_on_exit = true,
              float_opts = {
                  border = "curved",
              },
          })
      end,
  }
}

