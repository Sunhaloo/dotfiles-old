return {
    -- beloved one dark theme
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            require('onedark').setup({
                -- style set to the darker variant
                style = 'darker',
                -- style = 'light',
                transparent = true,
                term_colors = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'underline',
                    strings = 'italic',
                    variables = 'bold'
                },
                diagnostics = {
                    darker = true,
                    undercurl = true
                },

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
    },
    -- the goat @devaslife theme
    {
      "craftzdog/solarized-osaka.nvim",
      lazy = false,
      priority = 1000,
      config =  function()
          require("solarized-osaka").setup({
              -- set the background to transparent
              transparent = true,
          })
       end,
    },
    -- eldritch theme
    {
      "eldritch-theme/eldritch.nvim",
      lazy = false,
      priority = 1000,
      config = function()
          require("eldritch").setup({
              terminal_colors = true,
              transparent = true,
          })
      end,
    },
    -- cyberdream theme
    {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            terminal_colors = true,
            transparent = true,
            italic_comments = true,
            borderless_telescope = true,
        })
    end,
    },
}
