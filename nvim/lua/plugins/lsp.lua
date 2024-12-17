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
    config = function()
        -- configuration for 'nvim-lspconfig'
        local lspconfig = require("lspconfig")

        -- configuration for 'mason-lspconfig'
        local mason_lspconfig = require("mason-lspconfig")

        -- variable that will truncate `vim.keymap`
        local key = vim.keymap
        -- variable that will hold options for `noremap` and `silent`
        local opts = { noremap = true, silent = true }

    end,
}
