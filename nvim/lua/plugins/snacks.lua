return {
    {
        -- combination of some great plugins made by the man himself... Folke
        "folke/snacks.nvim",
        priority = 1000,
        -- plugin IS loaded in immediately during startup
        lazy = false,
        opts = {
            -- basically an animation library
            animate = {
                enabled = true,
                fps = 120
            },
            -- prevents LSP, Treesitter, etc to attach to really large files
            bigfile = {
                enable = true,
                -- configure size of file ( in bytes --> converting to megabytes )
                size = 0.8 * 1024 * 1024
            },
            -- dashboard setup
            -- NOTE: you need to have 'chafa' installed on your system
            dashboard = {
                -- enable the dashboard plugin
                enabled = true,
                -- what to show on the dashboard
                sections = {
                    -- display an image
                    {
                        section = "terminal",
                        cmd = "chafa $HOME/Wallpapers/anime_girl_fishing.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
                        padding = 2,
                        -- set the correct height for the image being used
                        height = 16,
                    },
                    -- shows the whatever header --> can be configured below
                    { section = "header" },
                    -- show the keymappings we customised below
                    { section = "keys", gap = 1, padding = 1 },
                    -- display the startup time
                    { section = "startup" }
                },
                preset = {
                    -- customise the keymappings found on dashboard
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "l", desc = "Live Grep Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = "? ", key = "h", desc = "Help Documentation", action = ":lua Snacks.dashboard.pick('help_tags')" },
                        { icon = " ", key = "o", desc = "Old Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "System Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.expand('$HOME/.config')})" },
                        { icon = " ", key = "q", desc = "Quit", action = "<Cmd>qa<CR>" },
                    },
                    -- change the "Neovim" header to this!
                    header = [[ "Developers Developers Developers" ]]
                }
            },
            -- renders file as quickly as possible before loading plugins
            quickfile = { enabled = true },
            --  provides indentation guides
            indent = { enabled = true },
            notifier = { enabled = true },
            -- basically 'neoscroll.nvim'
            scroll = { enabled = true },
            -- well... "pretty status column"
            statuscolumn = { enabled = true },
            -- shows LSP references and be able to quickly jump to them
            words = { enabled = true },
            -- well provides lazygit inside of Neovim
            lazygit = { enabled = true },
            -- better UI for renaming stuff ( think that its used by neo-tree and others )
            input = { enabled = false },
            -- INFO: still going to use 'toggleterm.nvim'
            terminal = { enabled = false },
        },
        -- keymappings for snacks.nvim's "sub-plugins"
        keys = {
            -- lazygit
            { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
        },
    }
}
