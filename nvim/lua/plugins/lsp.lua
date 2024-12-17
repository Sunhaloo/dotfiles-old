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
        -- create variables for configuration for both 'nvim-lspconfig' + 'mason-lspconfig'
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        -- variable that will truncate `vim.keymap`
        local key = vim.keymap

        -- configuration for 'nvim-lspconfig'
        -- create auto-command which will be loaded on event 'LspAttach'
        vim.api.nvim_create_autocmd("LspAttach", {
            -- create group ( organise and manage LSP auto-commands only )
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            -- create callback function ( 'event' as arg )
            callback = function(ev)
                -- variable what will hold these options for LOCAL Buffer ONLY
                local opts = { buffer = ev.buf, silent = true }

                -- keymaps for LSP
            end,
        })

        -- configuration for 'mason-lspconfig'
        mason_lspconfig = setup_handlers({})

    end,
}
