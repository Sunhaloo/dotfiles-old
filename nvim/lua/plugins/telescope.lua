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
    }
}
