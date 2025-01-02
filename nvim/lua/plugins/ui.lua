-- file where I will be keeping all UI related plugins
return {
    {
        -- plugin will be used to show what keymaps we have configured
        -- The Human Brain is NOT Good!
        "folke/which-key.nvim",
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- configuration for 'which-key'
        opts = {
            -- change the style / theme
            preset = "modern"
        },
        -- how to "open" / "call" 'which-key'
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show()
                end,
                desc = "Current Buffer Local Keymappings [ which-key ]"
            }
        },
    },
    {
        "lukas-reineke/virt-column.nvim",
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        -- event = "VeryLazy",
        event = "BufRead",
        -- configuration for 'virt-column'
        config = function()
            require("virt-column").setup({
                -- will be configured lated
            })
        end
    }
}
