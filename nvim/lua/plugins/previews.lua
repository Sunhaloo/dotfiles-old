return {
    {
        -- ulra, mega, chad plugin for general previewing
        "sylvanfranklin/omni-preview.nvim",
        -- dependencies to install with 'omni-preview'
        dependencies = {
            -- markdown previewer
            { "toppair/peek.nvim", lazy = true, build = "deno task --quiet build:fast" }
        },
        -- configuration for 'omni-preview'
        config = function()
            require("omni-preview").setup()
            -- configuration for 'peek' markdown previewer
            require("peek").setup({
                -- change default preview from 'webview' to 'browser'
                app = "browser"
            })
        end,
        -- customise the keymappings
        keys = {
            { "<leader>Op", "<Cmd>OmniPreview start<CR>", desc = "Start Omni Preview" },
            { "<leader>op", "<Cmd>OmniPreview stop<CR>",  desc = "Stop Omni Preview" }
        }
    }
}
