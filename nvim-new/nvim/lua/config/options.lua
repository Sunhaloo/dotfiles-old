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
-- keeps the identation of line ( for the next line )
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
-- indentation <Space> ( for the next line )
opt.shiftwidth = 4

-- Split Windows / Panes ( " -")
-- horizontal splits will go below the current window / pane
opt.splitbelow = true
-- verital splits will go to the right of the current window / pane
opt.splitright = true

-- Appearance
-- why does we have this?
opt.belloff = "all"
-- hide the neovim command line ( when not in use )
opt.cmdheight = 0
-- shows all syntax character for ( all / most file types )
opt.conceallevel = 0
-- stop the highlighting when leaving the search / query ( mode )
opt.hlsearch = false
-- pop up menus height for things like completion, etc
opt.pumheight = 10
-- enable transparency for pop up menus
opt.pumblend = 0
-- don't show mode in the neovim command line
opt.showmode = false
-- always show file name as tabs / like in VS Code ( 0 ==> disable | 1 ==> when there > 1 | 2 ==> always show )
opt.showtabline = 2
-- allow for more colours
opt.termguicolors = true
-- highlight the current line
opt.cursorline = true
-- show the line and column number separated by a comma
opt.ruler = false
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
