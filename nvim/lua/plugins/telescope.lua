return {
    {
        -- awesome ( general ) navigation plugin
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = {
            -- bunch of neovim functions
            "nvim-lua/plenary.nvim",
            -- improve sorting performance
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        -- configure telescope
        config = function ()
            -- create a variable for `telescope.builtin`
            local builtin = require("telescope.builtin")
            -- variable that will truncate `vim.keymap`
            local key = vim.keymap

            -- setup the keymappings for telescope
            key.set('n', "<leader>T", "<Cmd>Telescope<CR>", { desc = "Telescope" })
            key.set('n', "<leader>ff", builtin.find_files, { desc = "Find Files [ Telescope ]" })
            key.set('n', "<leader>fg", builtin.git_files, { desc = "Find Git Files [ Telescope ]" })
            key.set('n', "<leader>fo", builtin.oldfiles, { desc = "Find Old Files [ Telescope ]" })
            key.set('n', "<leader>fl", builtin.live_grep, { desc = "Live Grep [ Telescope ]" })
            -- WARNING: need to install 'todo-comments' by folke... I will be installing it later!
            key.set('n', "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Highlighted Comments [ Telescope ]" })

            -- miscellaneous keymappings for when I am getting bored
            -- change the colourscheme
            key.set('n', "<leader>th", builtin.colorscheme, { desc = "Change Colorscheme [ Telescope ]" })

            -- custom "custom" keymappings for Telescope ( refer to Teej's video )
            -- allow the user to search for files in the directory: `~/Obsidian/S.Sunhaloo`
            key.set('n', "<leader>fO", function ()
                -- get the `find_files` method for telescope
                builtin.find_files {
                    -- setup the custom directory ( in this case my Obsidian Vault )
                    cwd = "$HOME/Obsidian/S.Sunhaloo/"
                }
            end,
                {
                    desc = "Find Obsidian Files [ Telescope ]"
                }
            )
            -- allow the user to search for configuration files in the directory: `~/.config/`
            key.set('n', "<leader>fC", function ()
                -- get the `find_files` method for telescope
                builtin.find_files {
                    -- setup the custom directory for `~/.config/`
                    cwd = "$HOME/.config/"
                }
            end,
                {
                    desc = "Find Confiugration Files [ Telescope ]"
                }
            )
        end,
    }
}
