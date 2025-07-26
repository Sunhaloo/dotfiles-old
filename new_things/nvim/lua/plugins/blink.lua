return {
    -- better auto-completion for Neovim
    "Saghen/blink.cmp",
    -- dependencies to install with 'blink'
    dependencies = {
        -- gives us VS C*de snippets without any configuration
        "rafamadriz/friendly-snippets",
        -- custom snippet engine written in Lua
        "L3MON4D3/LuaSnip",
    },
    -- start on when in Insert Mode
    event = "InsertEnter",
    -- use a release tag to download pre-built binaries ==> default option
    version = '*',
}
