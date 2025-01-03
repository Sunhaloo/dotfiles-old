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
                    -- << General Options >>
                    -- make "bufferline" to act on tabs over buffers
                    mode = "tabs",
                    -- << Mouse Options >>
                    -- right click will make current buffer split horizontally
                    right_mouse_command = "horizontal sbuffer %d",
                    -- middle mouse button will make current buffer split vertically
                    middle_mouse_command = "vertical sbuffer %d",
                    -- << Appearance Options >>
                    -- indicate if you are on "current" buffer / tab
                    indicator = {
                        -- icon = " ",
                        -- change `style` to `'icon'` and uncomment line above to use icon
                        style = "underline"
                    },
                    -- << Icons >>
                    -- icons to show if file has been modified / changed
                    modified_icon = "",
                    -- color the icons
                    color_icons = true,
                    -- << Separator Style >>
                    -- options for the `separator_style`
                        -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
                    separator_style = "slant",
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
