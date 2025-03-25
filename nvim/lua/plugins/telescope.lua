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
                    ["fzf"] = {},
                    ["todo-comments"] = {},
                }
            })
            -- allow telescope to load our installed extensions
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("todo-comments")
        end,
    }
}
