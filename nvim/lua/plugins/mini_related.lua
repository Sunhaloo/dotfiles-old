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
        -- basically a better ( in my opinion ) colorizer plugin
        "echasnovski/mini.hipatterns",
        version = false,
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- configuration for 'mini.hipatterns'
        config = function()
            -- import the configuration file
            local mini_hipatterns = require("mini.hipatterns")
            -- setup 'mini.hipatterns'
            mini_hipatterns.setup({
                highlighters = {
					-- enable highlights for 'todo-comments.nvim' plugin
					bug = { pattern = '%f[%w]()BUG:()%f[%W]', group = 'MiniHipatternsFixme' },
					warning  = { pattern = '%f[%w]()WARNING:()%f[%W]',  group = 'MiniHipatternsHack'  },
					todo  = { pattern = '%f[%w]()TODO:()%f[%W]',  group = 'MiniHipatternsTodo'  },
					note  = { pattern = '%f[%w]()NOTE:()%f[%W]',  group = 'MiniHipatternsNote'  },
					info  = { pattern = '%f[%w]()INFO:()%f[%W]',  group = 'MiniHipatternsNote'  },
                    tip  = { pattern = '%f[%w()TIP:()%f[%W]',  group = 'MiniHipatternsTodo'  },

                    -- enable the highlights for hex color codes ( as per documentation )
                    hex_color = mini_hipatterns.gen_highlighter.hex_color()
                }
            })
        end,
    },
    -- {
    --     -- plugin similar to 'neoscroll' ==> provides overall 
    --     "echasnovski/mini.animate",
    --     version = false,
    --     -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
    --     event = "VeryLazy",
    --     -- configuration for 'mini.hipatterns'
    --     config = function()
    --         -- enable the animations
    --         require("mini.animate").setup({
    --             -- disable the cursor jumps animations ==> using 'SmoothCursor.nvim'
    --             cursor = { enable = false }
    --         })
    --     end,
    -- },
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
                vim.keymap.set('n', "<leader>e", "<Cmd>lua MiniFiles.open()<CR>", { desc = "File Explorer [ mini.nvim ]" }),

                -- change the default keymaps
                mappings = {
                    -- emulate a toggle "keymap" like 'neo-tree.nvim'
                    close = "<leader>e",
                    -- basically keymap to save changes after modifying files / folders
                    synchronize = "S"
                }
            })
        end,
    },
    {
        -- choosing 'mini.pairs' and testing it ( over 'nvim-autopairs' )
        "echasnovski/mini.pairs",
        version = false,
        -- start on when in Insert Mode
        event = "InsertEnter",
        -- configuration for 'mini.pairs'
        config = function()
            -- enable the autopairs plugin
            require("mini.pairs").setup({
                mappings = {
                    -- create autopairs for '<>' as mini.pairs does not come with that
                    ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
                    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
                }
            })
        end,
    },
    {
        -- choosing 'mini.surround' over 'nivm-surround'
        "echasnovski/mini.surround",
        version = false,
        -- start on when in Insert Mode
        event = "InsertEnter",
        -- configuration for 'mini.surround'
        config = function()
            -- enable the "surround" plugins
            require("mini.surround").setup({
                -- leaving blank for default setup... Why Though?
                -- because I always forget the I have something like 'nvim-surround' and never use it...
                -- but this time I will try to remember to use it
            })
        end,
    },
}
