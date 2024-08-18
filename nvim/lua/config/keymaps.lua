-- Keymap File Written in Lua

-- variables
-- no need to type prefix `vim.keymap` before every keymap
local keymap = vim.keymap
-- `noremap` prevents keymaps from being overwritten
-- `silent` tells Neovim to display the command or not to display the command
	-- if set to `true` will silent the commands
	-- if set to `false` will not silent the commands
local opts = { noremap = true, silent = false }

-- leader keys ---> set to `<Space>`
-- overall / global leader key takes control over "most" files
vim.g.mapleader = ' '
-- local leader key depends on specific buffers and filetypes
-- can be used to overide 'vim.g.mapleader` / global leader key
vim.g.maplocalleader = ' '

-- <C-i> is not <C-i> by default, need to make it become <C-i>
keymap.set("n", "<C-i>", "<C-i>", opts)

-- NORMAL Mode

-- copy to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- paste from system clipboard
keymap.set({"n", "v"}, "<leader>p", [["+p]])

-- increment / decrement numbers

-- increment using '+' character
keymap.set("n", "+", "<C-a>")
-- decrement using '-' character
keymap.set("n", "-", "<C-x>")

-- delete a word backwards
keymap.set("n", "dw", "vb_d")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- open lex
keymap.set("n", "lx", ":Lex<Return>")

-- tabs

-- new tab with `te`
keymap.set("n", "te", ":tabedit")
-- switch to next tab with `<Tab>`
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- switch to previous tab with `Shift+<Tab>`
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- split window ( neovim )
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move window ( from neovim to neovim )
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- resize windows
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- diagnostic
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)

-- insert mode

-- go to normal mode from insert mode
keymap.set("i", "jk", "<ESC>", opts)

-- navigation within insert mode
keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)
keymap.set("i", "<C-k>", "<Up>", opts)

-- visual mode

-- removing the annoying paste buffer / register thing
keymap.set("x", "p", [["_dP]])

-- go to normal mode from visual mode
keymap.set("v", "jk", "<ESC>", opts)

-- move lines of text
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- paste even when in visual mode
keymap.set("v", "p", '"_dP', opts)

-- stay in indent mode when tabbing / untabbing line or block of text or characters
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
keymap.set("n", "<leader>fg", ":Telescope git_files<cr>")
keymap.set("n", "<leader>fl", ":Telescope live_grep<cr>")
keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
