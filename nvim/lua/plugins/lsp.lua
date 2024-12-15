return {
    {
        -- clone the data only repo
        "neovim/nvim-lspconfig",
        -- for performance start the plugin on these 2 events
        events = { "BufReadPre", "BufNewFile" },
        -- other dependencies to clone
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                -- faster LuaLS setup
                "folke/lazydev.nvim",
                -- only enable on `.lua` files
                ft = "lua",
                -- default configuration
                opts = {
                  library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                  },
                },
            },
        },
        -- our configuration
        config = function()
            

        end,
    }
}
