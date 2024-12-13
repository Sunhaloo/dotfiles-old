-- variable that will truncate `vim.keymap`
local key = vim.keymap

-- variable that will hold options for `noremap` and `silent`
-- `noremap = true` ==> no recursion for the mapping.
-- `silent = true` ==> no need to show "keys" when pressing keymaps in status line
local opts = { noremap = true, silent = true }


-- leader keys ( global and local )
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- << General Keymaps >>
