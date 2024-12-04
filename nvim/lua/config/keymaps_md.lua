-- variable to shortend `vim.keymap`
local keymap = vim.keymap
-- `noremap` prevents keymaps from being overwritten
-- `silent` tells Neovim to display the command or not to display the command
	-- if set to `true` will silent the commands
	-- if set to `false` will not silent the commands
local opts = { noremap = true, silent = true }

-- leader keys ---> set to `<Space>`
-- overall / global leader key takes control over "most" files
vim.g.mapleader = ' '
-- local leader key depends on specific buffers and filetypes
-- can be used to overide 'vim.g.mapleader` / global leader key
vim.g.maplocalleader = ' '

keymap.set("n", "<leader>fO", "<cmd>ObsidianSearch<CR>", { desc = "Search in Obsidian Vault" })

-- markdown preview
keymap.set("n", "<leader>Mp", ":MarkdownPreview<CR>", { desc = "Markdown Preview Start" })
keymap.set("n", "<leader>Mps", ":MarkdownPreviewStop<CR>", { desc = "Markdown Preview Stop" })

-- Helper function for setting keymaps
local function set_keymap(mode, key, command)
  vim.keymap.set(mode, key, command, { noremap = true, silent = true })
end

-- Example usage with proper Lua syntax and caret placement
set_keymap('i', '<C-b>', function()
  if require('luasnip').expand_or_jumpable() then
    require('luasnip').expand_or_jump()
  else
    -- Insert ** and move the cursor between them
    vim.api.nvim_feedkeys("****", 'n', true)
    vim.api.nvim_input("<Left><Left>")  -- Move the cursor between the stars
  end
end)

set_keymap('i', '<C-i>', function()
  if require('luasnip').expand_or_jumpable() then
    require('luasnip').expand_or_jump()
  else
    -- Insert * and move the cursor between them
    vim.api.nvim_feedkeys("**", 'n', true)
    vim.api.nvim_input("<Left>")  -- Move the cursor between the stars
  end
end)
