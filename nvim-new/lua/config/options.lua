-- create a variable to shortend `vim.opt`
local opt = vim.opt

-- followed Chris@ChrisMachine's Neovim `options.lua` file

-- System
-- don't create a backup file
opt.backup = false
-- allow neovim to use system clipboard
opt.clipboard = "unnamedplus"
-- encoding of file
opt.fileencoding = "utf-8"

-- querying for a "word" does not need to be case sensitive
opt.ignorecase = true
-- querying for case-sensitive words ( if search query have uppercase letters )
opt.smartcase = false
-- keeps the identation of line ( when pressing <CR> )
opt.smartindent = true
-- don't create a swap file
opt.swapfile = false
-- amount of time for keymaps to actually register and "confirm"
opt.timeoutlen = 1250
-- allow for persistent undo
opt.undofile = false
-- faster completion time ( default value = 4000ms )
opt.updatetime = 100
-- does not create a backup file
opt.writebackup = false
-- does not use <Space> for <Tab>
opt.expandtab = false
-- number of spaces for a <Tab> character 
opt.tabstop = 4
opt.shiftwidth = 4 -- Number of spaces inserted for each indentation

-- Split Windows / Panes ( " -")
opt.splitbelow = true -- Force all horizontal splits to go below current window )
opt.splitright = true -- Force all vertical splits to go to the right of current windows

-- Appearance
opt.belloff = "all" -- WTF man a bell!!!
opt.cmdheight = 0 -- Space for Neovim Command Line ( in this case NO space )
opt.conceallevel = 0 -- Will show `` in markdown files
opt.hlsearch = false -- Stops higlighting the search after you leave the search
opt.pumheight = 10 -- The pop up menu height ( idk need to play with the number )
opt.pumblend = 0 -- Transparency for pop up menus
-- opt.showmode = true -- Shows "NORMAL", "INSERT", "VISUAL" modes in cmd line ( needs to put `opt.cmdheight` to anyvalue expect '0' )
opt.showmode = false -- Does NOT show "NORMAL", "INSERT", "VISUAL" modes in cmd line
opt.showtabline = 1 -- Always show tabs ( instead of buffers - like in Lazy Vim )
opt.termguicolors = true -- Allows for more colours ( 24 bits ---> Themes can be used )
opt.cursorline = true -- Highlights the current line
opt.ruler = true -- Displays information such as current line number, column number, and other status information ( to see difference check neovim status line )
opt.showcmd = true -- Display incomplete command in status line ( useful for providing visual feedback )
opt.number = true -- Adds number line
opt.relativenumber = true -- Line numbers will be relative
opt.signcolumn = "yes" -- Shows errors and other information next to the line numbers
opt.scrolloff = 0 -- Controls the minimum number of screen lines to keep above and below the cursor when scrolling
opt.sidescrolloff = 8 -- Controls the minimum number of columns to keep to the left and right of the cursor when scrolling horizontally
opt.title = true -- Shows the title in the Terminal Tab ( look up )
opt.titlelen = 0 -- Do NOT shorten the Title length
opt.guifont = "JetBrainsMono Nerd Font" -- Sets the font for ther GUI version of Neovim
opt.shortmess:append("I") -- Disables Intro / Start Message

vim.g.netrw_banner = 0 -- Disable message in "Lex" / netrw
vim.g.netrw_mouse = 2 -- Allows for mouse usage in "Lex" / netrw
