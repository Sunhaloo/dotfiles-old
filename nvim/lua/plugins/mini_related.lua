return {
    {
        -- icons! What else can I say!
        "echasnovski/mini.icons",
        version = false,
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- configuration for 'mini.icons'
        config = function()
            -- enable the icons ( as per documentation )
            require("mini.icons").setup({
                -- set the icons to either 'glyph' ( actual icons ) or 'ascii' ( good for no desktop or as fallback )
                style = "glyph"
            })
        end,
    },
    {
        -- my choice for a file tree ( rival 'oil.nvim' for me )
        "echasnovski/mini.files",
        version = false,
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- configuration for 'mini.files'
        config = function()
            -- enable the file manager ( as per documentation )
            require("mini.files").setup({
                -- create keymap to quickly and easily open file manager
                vim.keymap.set('n', "<leader>e", "<Cmd>lua MiniFiles.open()<CR>", { desc = "File Manager" }),

                -- change the default keymaps
                mappings = {
                    -- emulate a toggle "keymap" like 'neo-tree.nvim'
                    close = "<leader>e",
                    -- basically keymap to save changes after modifying files / folders
                    synchronize = "S"
                }
            })
        end,
    }
}
