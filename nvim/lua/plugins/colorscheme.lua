return {

    {
      "olimorris/onedarkpro.nvim",
      -- name to use in `init.lua` file
      name = "onedark",
      enabled = true,
      priority = 1000,
      config = function()
          require("onedarkpro").setup({
              options = {
                  cursorline = false,
                  transparency = true,
                  terminal_colors = true,
              }
          })
      end,
    }

}
