return {
    {
        -- better auto-completion for Neovim
        "saghen/blink.cmp",
        -- dependencies to install with 'blink'
        dependencies = { "rafamadriz/friendly-snippets" },
        -- start on this event
        event = { "InsertEnter" },
        -- use a release tag to download pre-built binaries ==> default option
        version = '*',
        -- configure 'blink'
        opts = {
            -- keymap configuration
            keymap = {
                -- default preset = 'default' | vs-c*de like preset = 'super-tab'
                -- preset = 'default'
                preset = 'super-tab'
            },

            -- appearance configuration
            appearance = {
                -- use 'nvim-cmp' appearance by default as most theme does not support 'blink.cmp'
              use_nvim_cmp_as_default = true,
                -- 'mono' ==> 'Nerd Font Mono' Fonts | 'normal' ==> 'Nerd Font' Fonts ( NOT Mono Variant )
              nerd_font_variant = 'mono',

            },
            -- from line 28 to 44 ==> set border of completion to 'rounded'
            completion = {
                menu = {
                    border = 'rounded'
                },

                documentation = {
                    window = {
                        border = 'rounded'
                    }
                },
            },
            signature = {
                window = {
                    border = 'rounded'
                }
            },


            -- priority for sourcing auto-completion
            sources = {
                -- basically show auto-completion in this priority
                default = { 'lsp', 'snippets', 'buffer', 'path' },
            },
        },
        -- where and how to get the auto-completion
        opts_extend = { "sources.default" }
    }
}
