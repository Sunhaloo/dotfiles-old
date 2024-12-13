-- variable that will truncate `vim.key`
local key = vim.keymap

-- variable that will hold options for `noremap` and `silent`
-- `noremap = true` ==> no recursion for the mapping.
-- `silent = true` ==> no need to show "keys" when pressing keys in status line
local opts = { noremap = true, silent = true }


-- leader keys ( global and local )
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NOTE: using `<cmd>` means that you need to use `<CR>

-- << Reload and Package Management >>

-- reload the current file
key.set('n', "<leader>R", "<Cmd>source %<CR>", { desc = "Reload Neovim" })
-- open 'lazy' "start" window
key.set('n', "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy Plugin Manager" })

-- << Quality of Life >>

-- remap <Esc> to <jk>
key.set("i", "jk", "<ESC>", opts)
-- select all within file
key.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All"})
-- copy to system clipboard
key.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy TO System Clipboard" })
-- paste from system clipboard
key.set({"n", "v"}, "<leader>p", [["+p]], { desc = "Paste FROM System Clipboard" })
-- search and replace

-- my weird fucking keymappings ( My QOL Improvement )
key.set("i", "<C-h>", "<Left>", opts)
key.set("i", "<C-l>", "<Right>", opts)
key.set("i", "<C-j>", "<Down>", opts)
key.set("i", "<C-k>", "<Up>", opts)
