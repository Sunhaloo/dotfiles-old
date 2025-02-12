return {
    {
        -- my beloved onedark theme
        "navarasu/onedark.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
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
            require("onedark").load()
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
    },
    {
        -- a black theme with better colours for highlighting than base16_black_gorgoroth
        "vague2k/vague.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'vague'
        config = function()
            require("vague").setup({
                -- toggle transparency
                transparent = true
            })
        end
    },
}
