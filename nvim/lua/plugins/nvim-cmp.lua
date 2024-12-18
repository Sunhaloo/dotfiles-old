return {
    -- "better" auto completions ( see `:h omnifunc` )
    "hrsh7th/nvim-cmp",
    -- start plugin on this event
    events = { "InsertEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    }
}
