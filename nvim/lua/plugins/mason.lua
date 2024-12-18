return {
    -- package manager for LSP, Linters, Formatters
    "williamboman/mason.nvim",
    -- dependencies to install with 'mason'
    dependencies = {
        -- acts like a bridge between 'nvim-lspconfig' and 'mason' itself
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- create variables for configuration for both 'mason-lspconfig' + 'mason'
        local mason_lspconfig = require("mason-lspconfig")
        local mason = require("mason")

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
            automatic_installation = true
        })
    end,
}
