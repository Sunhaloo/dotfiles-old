local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- -- importing and enabling the 'friendly-snippets.nvim' plugin
require("luasnip.loaders.from_vscode").lazy_load()

-- checks whether that the snippets is available ( based on keymapping )
local function expand_snippet(trigger)
    -- checks if the snippets exists for the markdown filetype
    local available_snippets = ls.get_snippets("markdown")
    -- searches for the correct snippets
    for _, snippet in ipairs(available_snippets or {}) do
        -- if the keymapping is same as snippet's trigger
        if snippet.trigger == trigger then
            -- expands snippets ==> we get the snippets we want
            ls.snip_expand(snippet)
            return
        end
    end
    -- if no snippets is available for that keymapping
    print("No snippet available for trigger: " .. trigger)
end

-- keymapping for calling the `"bold"` snippet from friendly-snippets
vim.api.nvim_buf_set_keymap(0, 'i', '<C-b>', '', {
    -- some Neovim's options
    noremap = true,
    silent = true,
    -- callback function to get the snippets
    callback = function()
        -- expands the snippets with the function above
        expand_snippet("bold")
    end
})

-- keymapping for calling the `"italic"` snippet from friendly-snippets
vim.api.nvim_buf_set_keymap(0, 'i', '<C-i>', '', {
    -- some Neovim's options
    noremap = true,
    silent = true,
    -- callback function to get the snippets
    callback = function()
        -- expands the snippets with the function above
        expand_snippet("italic")
    end
})

-- keymapping for calling the `"link"` snippet from friendly-snippets
vim.api.nvim_buf_set_keymap(0, 'i', '<C-k>', '', {
    -- some Neovim's options
    noremap = true,
    silent = true,
    -- callback function to get the snippets
    callback = function()
        expand_snippet("link")
    end
})

-- keymapping for calling the `"mytask"` snippet from Custom Luasnip snippets
vim.api.nvim_buf_set_keymap(0, 'i', '<C-l>', '', {
    -- some Neovim's options
    noremap = true,
    silent = true,
    -- callback function to get the snippets
    callback = function()
        expand_snippet("mytask")
    end
})

-- the "code" in the return statement are some of custom Luasnip ( snippets ) that I wrote
return {
    -- snippet to link markdown files in Obsidian
    s("Olink", {
        t({
            "[["
        }),
        i(1),
        t({
            "]]"
        })
    }),
    -- snippet to create task
    -- NOTE: 'friendly-snippets' already has a "task" thingy but I hate where it places the cursor
    s("mytask", {
        t({
            "- [ ] "
        }),
        i(1)
    })

}
