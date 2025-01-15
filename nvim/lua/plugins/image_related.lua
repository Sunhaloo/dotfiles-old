local function obsidian_image_dir(document_path, image_path, fallback)
    -- enter the path to the "root" of the images ( folders )
    local image_root = os.getenv("HOME") .. "/Obsidian/S.Sunhaloo/Obsidian Management/Media/Images/"
    -- check if image is expanded to the full path and exists in 'Images'
    local full_path = image_root .. image_path
    if vim.fn.filereadable(full_path) == 1 then
        -- return the full path / absolute path of the file / image
        return full_path
    end

    -- search the sub-folders found in the 'Images' folder if not found in 'Images' folder
    -- TIP: remember what we used in the PyYu code "glob glob glob"
    local glob_path = image_root .. "**/" .. image_path
    -- basically find the file that we are looking for but matching them with "glob glob glob"
    local matched_files = vim.fn.glob(glob_path, false, true)

    -- if `#matched_files` is greater than 1 ==> file found
    if #matched_files > 0 then
        -- return the 'first' match
        -- TIP: you can modify this to handle multiple matches
        return matched_files[1]
    else
        -- if the file / image has not been found
        return fallback(document_path, image_path)
    end
end

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
                        filetypes = { "markdown", "vimwiki" },
                        -- custom images directory ==> in this case our Obsidian Management directory
                        resolve_image_path = obsidian_image_dir,
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
                },
            })
        end
    }
}
