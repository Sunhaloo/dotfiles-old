return {
    {
        -- snippets engine
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- optional to install 'jsregexp' ( make sure that you have 'luarocks' on your system )
        build = "make install_jsregexp",
        -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
        event = "VeryLazy",
        -- dependencies to install with 'LuaSnip'
        dependencies = {
            -- provide VS C*de's Snippets without any configuration
            "rafamadriz/friendly-snippets"
        },
        -- configuration for LuaSnip
        config = function()
        end,
    }
}
