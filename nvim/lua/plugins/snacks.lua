return {
    {
        -- combination of some great plugins made by the man himself... Folke
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            animate = { enabled = true },
            bigfile = { enabled = true },
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
                        height = 17,
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
                    header = [[ "Developers Developers Developers" ]]
                }
            },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    }
}
