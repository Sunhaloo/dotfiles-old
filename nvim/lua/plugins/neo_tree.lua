return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        keys = {
            {"<leader>e", ":Neotree toggle left<CR>", silent = true, desc="FileExplorer Left"},
            {"<leader>f", ":Neotree toggle float<CR>", silent = true, desc="FileExplorer Float"}
        }
    }
}
