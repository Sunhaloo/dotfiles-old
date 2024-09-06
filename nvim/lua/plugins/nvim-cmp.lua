return {
    "hrsh7th/nvim-cmp",
    -- lazy load this 1 event
    -- when in Insert Mode
    event = "InsertEnter",
    dependencies = {
        -- the thing the allow to give completion in the current file
        "hrsh7th/cmp-buffer",
        -- the thing that allow completion of path in system ( like path to images, etc )
        "hrsh7th/cmp-path",
        -- add LuaSnip plugin
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        -- auto-completion of snips
        "saadparwaiz1/cmp_luasnip",
        -- some friendly snippets that are already available
        "rafamadriz/friendly-snippets",
        -- idk this one
        "onsails/lspkind.nvim",
    }
}
