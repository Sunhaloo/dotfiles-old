-- file where I will be keeping all image related plugins
return {
    {
        -- "lua package manager" in Neovim
        "vhyrro/luarocks.nvim",
        -- run the plugin before anything else
        priority = 1001,
        -- default configuration for 'luarocks'
        opts = {
          rocks = { 'magick' },
        }
    },
    {
        -- plugin that will provide us with the images
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        -- configuration for 'image'
        config = function()
            require("image").setup({
                -- backend for rendering images
                backend = "kitty",
                kitty_method = "normal",
                -- setup different "integrations" for 'image'
                integrations = {
                    -- setup for markdown
                    markdown = {
                        -- actually enable for markdown
                        enabled = true,
                        -- "clear" the image / disables the images when in INSERT mode
                        clear_in_insert_mode = true,
                        -- render the image when cursor / caret is on it
                        only_render_image_at_cursor = true,
                        -- filetypes to "enable" this plugin on
                        filetypes = { "markdown" },
                        resolve_image_path = function(document_path, image_path, fallback)
                            local obsidian_client = require("obsidian").get_client()
                                local new_image_path = obsidian_client:vault_relative_path(image_path).filename
                                if vim.fn.filereadable(new_image_path) == 1 then
                                    return new_image_path
                                else
                                    return fallback(document_path, image_path)
                            end
                        end,
                    },
                    -- setup for HTML
                    html = {
                        -- actually enable for markdown
                        enabled = true,
                        -- "clear" the image / disables the images when in INSERT mode
                        clear_in_insert_mode = true,
                        -- render the image when cursor / caret is on it
                        only_render_image_at_cursor = true,
                    }
                }
            })
        end
    }
}
