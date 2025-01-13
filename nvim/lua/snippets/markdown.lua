local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Ensure friendly-snippets are loaded
require("luasnip.loaders.from_vscode").lazy_load()

-- Helper to expand specific snippets
local function expand_snippet(trigger)
    -- Check if the trigger exists
    local available_snippets = ls.get_snippets("markdown")
    for _, snippet in ipairs(available_snippets or {}) do
        if snippet.trigger == trigger then
            ls.snip_expand(snippet)
            return
        end
    end
    print("No snippet available for trigger: " .. trigger)
end

-- Key mappings for markdown snippets
vim.api.nvim_buf_set_keymap(0, 'i', '<C-b>', '', {
    noremap = true,
    silent = true,
    callback = function()
        expand_snippet("bold") -- Use 'bold' trigger
    end
})

vim.api.nvim_buf_set_keymap(0, 'i', '<C-i>', '', {
    noremap = true,
    silent = true,
    callback = function()
        expand_snippet("italic") -- Use 'italic' trigger
    end
})

vim.api.nvim_buf_set_keymap(0, 'i', '<C-k>', '', {
    noremap = true,
    silent = true,
    callback = function()
        expand_snippet("link") -- Use 'italic' trigger
    end
})

return {
    s("Olink", {
        t({
            "[["
        }),
        i(1),
        t({
            "]]"
        })
    })
}
