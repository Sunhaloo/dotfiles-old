return {
   -- main LSP configuration
    {
        -- quickstart configurations for LSP
        "neovim/nvim-lspconfig",
        -- start on these 2 events
        event = { "BufReadPre", "BufNewFile" },
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

        -- configure LSP servers
        config = function()
            -- variable that will truncate `vim.keymap`
            local key = vim.keymap

            -- configuration for 'nvim-lspconfig'
            -- create auto-command which will be loaded on event 'LspAttach'
            vim.api.nvim_create_autocmd("LspAttach", {
                -- create group ( organise and manage LSP auto-commands only )
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                -- create callback function ( 'event' as arg )
                callback = function(ev)
                    -- create a variable for `telescope.builtin`
                    local builtin = require("telescope.builtin")
                    -- variable what will hold these options for LOCAL Buffer ONLY
                    local opts = { buffer = ev.buf, silent = true }

                    -- keymaps for LSP
                    opts.desc = "Show LSP Definitions"
                    key.set('n', "gd", builtin.lsp_definitions, opts)

                    opts.desc = "Go To Declaration"
                    key.set('n', "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Show LSP References"
                    key.set('n', "gR", builtin.lsp_references, opts)

                    opts.desc = "Show LSP Type Implementations"
                    key.set('n', "gi", builtin.lsp_implementations, opts)

                    opts.desc = "Show LSP Type Definitions"
                    key.set('n', "gt", builtin.lsp_type_definitions, opts)

                    opts.desc = "Show Line Diagnostics"
                    key.set('n', "<leader>d", vim.diagnostic.open_float, opts)

                    opts.desc = "Show Buffer Diagnostics"
                    -- key.set('n', "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", opts)
                    key.set('n', "<leader>D", builtin.diagnostics, opts)

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
        end,
    },

    -- 'mason.nvim' configuration
    {
        -- package manager for LSP, Linters, Formatters
        "williamboman/mason.nvim",
        -- dependencies to install with 'mason'
        dependencies = {
            -- acts like a bridge between 'nvim-lspconfig' and 'mason' itself
            "williamboman/mason-lspconfig.nvim",
            -- will allow us to download formatters automatically
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            -- completion "engine" that will be able to source LSP completions
            "Saghen/blink.cmp",
        },

        -- configuration for 'mason' and 'mason-lspconfig'
        config = function()
            -- import configuration files
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")
            local lspconfig = require("lspconfig")
            local completion = require("blink.cmp")


            -- configuration for 'mason'
            mason.setup({
                -- ui configuration for mason
                ui = {
                    -- do `:h nvim_open_win()` for options
                    border = "rounded",
                    -- configure the icons
                    icons = {
                        package_installed = " ",
                        package_pending = " ",
                        package_uninstalled = " "
                    }
                }
            })
            -- configuration for 'mason-lspconfig'
            mason_lspconfig.setup({
                -- make sure that these LSPs are installed "by default"
                ensure_installed = {
                    -- programming / code related
                    "lua_ls",
                    "pyright",
                    -- writing / markdown related
                    "marksman",
                    "ltex"
                },
                -- installs "Not-Installed" LSPs ( or others ) if LSPs ( or other ) is already configured
                automatic_installation = true,
            })

            -- configuration for 'mason-tool-installer'
            mason_tool_installer.setup({
                -- make sure that these formatters are installed "by default"
                ensure_installed = {
                    -- lua related
                    "luacheck",
                    "stylua",
                    -- python related
                    "black",
                    "isort",
                    "ruff"
                },
                -- auto update them
                auto_update = true,
                -- don't run on start
                run_on_start = true,
            })

            -- autoformat python files with 'black' and 'isort' on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.py",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })

            -- configuration for 'blink.cmp' ( LSP Side )
            -- setup neovim to enhance autocompletion with 'blink.cmp'
            local capabilities = completion.get_lsp_capabilities()

            -- configuration for 'mason-lspconfig' ( configure LSP server with 'mason-lspconfig' )
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        -- pass that "better" autocompletion ( blink.cmp ) "settings" to the default one's
                        capabilities = capabilities
                    })
                end,

                -- configure 'pyright'
                ["pyright"] = function()
                    lspconfig["pyright"].setup({
                        -- enhance auto-completion "engine" for 'pyright' with 'blink.cmp'
                        capabilities = capabilities
                    })
                end,
            })
        end,
    },
    {
        -- better syntax highlighting
        "nvim-treesitter/nvim-treesitter",
        -- run the command `:TSUpdate` whenever we are updating plugins with 'lazy'
        build = ":TSUpdate",
        -- start on these 2 events
        event = { "BufReadPre", "BufNewFile" },
        -- configuration for 'nvim-treesitter'
        config = function()
            -- import the configuration files for 'nvim-treesitter'
            require("nvim-treesitter.configs").setup({
                -- make sure that parsers for these languages are installed by "default"
                ensure_installed = {
                    "lua",
                    "python",
                    "markdown",
                    "markdown_inline"
                },
                -- enable highlighting
                highlight = {
                    enable = true,
                    -- disable highlights / 'nivm-treesitter' based on file types
                    disable = {},
                },
                -- enable indentation ( view documentation for more information )
                indent = {
                    enable = true,
                },
                -- what parsers do we need to ignore
                ignore_install = {},
                -- no need to install parsers automatically ( write down what you need manually )
                auto_install = false,
                -- don't install parsers synchronously 
                sync_install = false,
            })
        end,
    }
}
