return {
    -- quickstart configurations for LSP
    "neovim/nvim-lspconfig",
    -- start on these 2 events
    events = { "BufReadPre", "BufNewFile" },
    -- dependencies to install with 'nvim-lspconfig'
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
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
        -- NOTE: for some reason it's not `cmp-nvim-lsp` instead its `cmp_nvim_lsp`
        local nvim_cmp_lsp = require("cmp_nvim_lsp")

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
                opts.desc = "Show LSP Definitions"
                key.set('n', "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Go To Declaration"
                key.set('n', "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP References"
                key.set('n', "gR", "<Cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Show LSP Type Implementations"
                key.set('n', "gi", "<Cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP Type Definitions"
                key.set('n', "gt", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "Show Line Diagnostics"
                key.set('n', "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show Buffer Diagnostics"
                key.set('n', "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Next Diagnostics"
                key.set('n', "]d", vim.diagnostic.goto_next, opts)

                opts.desc = "Previous Diagnostics"
                key.set('n', "[d", vim.diagnostic.goto_prev, opts)

                opts.desc = "Show Documentation Under Cursor"
                key.set('n', "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                key.set('n', "<leader>rs", "<Cmd>LspRestart<CR>", opts)
            end,
        })

        -- configuration for 'cmp-nvim-lsp'
        -- setup neovim to enhance autocompletion with 'nvim-cmp'
        local capabilities = nvim_cmp_lsp.default_capabilities()

        -- configuration for 'mason-lspconfig' ( configure LSP server with 'mason-lspconfig' )
        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    -- pass that "better" autocompletion ( nvim-cmp ) "settings" to the default one's
                    capabilities = capabilities
                })
            end,
        })

    end,
}
