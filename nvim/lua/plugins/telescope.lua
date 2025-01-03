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
            -- icons for telescope
            "echasnovski/mini.icons",
        },
        -- configure telescope
        config = function ()
            -- general telescope configuration
            require("telescope").setup({
                -- change the theme for git files ( 'git_files' picker )
                pickers = {
                    git_files = {
                        -- change the themes to 'ivy'
                        theme = "ivy"
                    }
                },
                -- "custom" extension that we can add to telescope
                extensions = {
                    fzf = {}
                }
            })
            
            -- allow telescope to load our installed extensions
            require("telescope").load_extension("fzf")

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
                -- get the `find_files` method for telescope + use the 'ivy' theme
                builtin.find_files(require("telescope.themes").get_ivy({
                    -- setup the custom directory ( in this case my Obsidian Vault )
                    cwd = "$HOME/Obsidian/S.Sunhaloo/"
                }))
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
                    -- un-comment the line below to search Neovim configuration directory only
                    -- cwd = vim.fn.stdpath("config")
                }
            end,
                {
                    desc = "Find Configuration Files [ Telescope ]"
                }
            )
            -- allow the user to search for help documentation
            key.set('n', "<leader>fh", builtin.help_tags, { desc = "Help - Documentation [ Telescope ]" })
        end,
    }
}
