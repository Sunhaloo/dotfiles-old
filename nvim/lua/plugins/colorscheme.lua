return {

    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            require('onedark').setup({
                style = 'darker',
                transparent = true,
                term_colors = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'bold',
                    functions = 'underline',
                    strings = 'none',
                    variables = 'none'
                },
                diagnostics = {
                    darker = true,
                    undercurl = true
                },

            })
        end,
    },

    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
          require("tokyonight").setup({
              style = "storm",
          })
      end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                background = {
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = true,
            })
        end,
    }

}
