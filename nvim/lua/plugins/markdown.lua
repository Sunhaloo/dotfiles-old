return {
    {
        -- better visual and UI for markdown files
        "MeanderingProgrammer/render-markdown.nvim",
        -- start on these 2 events
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.icons"
        },
    },
    {
        -- basically "Obsidian" in Neovim
        "epwalsh/obsidian.nvim",
        version = "*",
        -- plugin is NOT loaded in immediately during startup
        lazy = true,
        -- on what filetype to act
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- configuration for 'obsidian.nvim'
        opts = {
            -- configure the vaults
            workspaces = {
                {
                    -- main workspace / vault
                    name = "Main Vault ( S.Sunhaloo )",
                    path = "~/Obsidian/S.Sunhaloo/"
                },
                {
                    -- secondary workspace / vault
                    name = "QnA Vault",
                    path = "~/Obsidian/Question - Problems - Solutions/"
                },
            },
            -- configure the path to obsidian's templates
            templates = {
                folder = "~/Obsidian/S.Sunhaloo/Obsidian Management/Templates/"
            },
            -- NOTE: Testing notes sub-directory folder
            notes_subdir = "~/Obsidian/S.Sunhaloo/Learning/",
            -- don't allow 'obsidian.nvim' to handle the YAML frontmatter
            disable_frontmatter = true
        }
    }
}
