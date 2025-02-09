return {
    {
        -- base16 themes
        "RRethy/base16-nvim",
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration
        config = function()
            -- change comment color
            require('base16-colorscheme').setup({
                base00 = '#000000', base01 = '#121212', base02 = '#222222', base03 = '#666666',
                base04 = '#999999', base05 = '#c1c1c1', base06 = '#999999', base07 = '#c1c1c1',
                base08 = '#5f8787', base09 = '#aaaaaa', base0A = '#8c7f70', base0B = '#9b8d7f',
                base0C = '#aaaaaa', base0D = '#888888', base0E = '#999999', base0F = '#444444'
            })
            -- apply the theme
            -- vim.cmd('colorscheme base16-black-metal-gorgoroth')

            -- NOTE: I don't know how to use the theme / colours that I defined
            -- this is why I am changing the color for the comment in   '~/.local/share/nvim/lazy/base16-nvim/colors/'
            -- apply my custom theme ( based on black-metal-gorgoroth)
            -- vim.cmd('colorscheme base16-my-gorgoroth')
        end
    },
    {
        -- my beloved onedark theme
        "navarasu/onedark.nvim",
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for the beloved onedark theme
        config = function()
            require("onedark").setup({
                -- select from 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                style = "darker",
                -- enable transparency
                transparent =  true,
                -- allow the theme to have cohesion with terminal theme
                term_colors = true,
                -- allow user to use keymapping to change between variants of the theme
                toggle_style_key = "<leader>oth",
                -- you can add more to the array if you want more variants
                toggle_style_list = {"darker", "light"},
                -- lualine theme configuration
                lualine = { transparent = true },

                -- change the grey colour
                -- NOTE: this is done so that we can see comments better with transparency on!
                colors = {
                    grey = "#7a818e"
                }
            })
            -- apply the theme
            -- require("onedark").load()
        end
    },
    {
        -- in my opinion; the most polished theme
        "folke/tokyonight.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'tokyonight'
        config = function()
            require("tokyonight").setup({
                -- select from 'moon', 'storm', 'night' and 'day'
                style = "night",
                -- disable transparency
                transparent =  false,
                -- allow the theme to have cohesion with terminal theme
                terminal_colors = true,
            })
        end,
    },
    {
        -- the most colourless colourful grey theme
        "shaunsingh/nord.nvim",
        config = function()
            -- toggle transparency
            vim.g.nord_disable_background = false
            -- load theme
            -- require("nord").set()
        end
    },
    {
        -- cozy ( I hate this fucking word ) theme
        "ellisonleao/gruvbox.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'gruvbox'
        config = function()
            require("gruvbox").setup({
                -- use terminal colours
                terminal_colors = true,
                -- toggle transparency
                transparent_mode = false,
                -- dim the inactive ( buffer I think )
                dim_inactive = false
            })
        end
    }
}
