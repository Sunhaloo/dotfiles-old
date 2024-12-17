return {
    -- quickstart configurations for LSP
    "neovim/nvim-lspconfig",
    -- start on these 2 events
    events = { "BufReadPre", "BufNewFile" },
    -- dependencies to install with 'nvim-lspconfig'
    dependencies = {
        {
            -- faster LuaLS things
            "folke/lazydev.nvim",
            -- load only on lua 'filetypes'
            ft = "lua",
            opts = {
              library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
        },
    },
    -- configuration for 'nvim-lspconfig'
    config = function()
    end,
}
