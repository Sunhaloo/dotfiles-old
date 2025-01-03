-- file where I will be keeping all UI related plugins
return {
    {
        -- plugin for "tab" / buffer ( customisation )
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "echasnovski/mini.icons" },
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- need to add the keymaps ( as bufferline overrides it )
        keys = {
            -- refer to `keymaps.lua` file
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab / Buffer [ bufferline ]" },
            { "<Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Next Tab / Buffer [ bufferline ]" }
        },
        -- configuration for 'bufferline'
        config = function()
            require("bufferline").setup({
                -- general options and appearance configuration
                options = {
                    mode = "tabs",
                }
            })
        end,
    },
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
        -- plugin that "highlights" the 80th column
        "lukas-reineke/virt-column.nvim",
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- configuration for 'virt-column'
        config = function()
            require("virt-column").setup({
                -- change the default "pipe" character
                char = "|",
                -- similar to `vim.opt.colorcolumn`
                virtcolumn = "80",
            })
        end
    }
}
