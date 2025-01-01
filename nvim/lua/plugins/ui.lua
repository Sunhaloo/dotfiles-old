-- file where I will be keeping all UI related plugins
return {
    {
        -- plugin will be used to show what keymaps we have configured
        -- The Human Brain is NOT Good!
        "folke/which-key.nvim",
        event = "VeryLazy",
        -- configuration for 'which-key'
        opts = {
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
        -- icons configuration
        icons = {
            breadcrumb = ".."
        }
    },
}
