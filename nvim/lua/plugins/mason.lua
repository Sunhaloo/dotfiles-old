return {
    -- package manager for LSP, Linters, Formatters
    "williamboman/mason.nvim",
    -- dependencies to install with 'mason'
    dependencies = {
        -- acts like a bridge between 'nvim-lspconfig' and 'mason' itself
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- configuration for 'mason'
        require("mason").setup({
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
        require("mason-lspconfig").setup({
            -- make sure that these LSPs are installed "by default"
            ensure_installed = {
                -- programming / code related
                "lua_ls",
                "pyright",
                -- writing / markdown related
                "marksman",
                "ltex"
            }
        })
    end,
}
