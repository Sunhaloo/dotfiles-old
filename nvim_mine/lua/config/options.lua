local opt = vim.opt

-- Follow Chris@ChrisMachine's "nvim" `options.lua' file

-- System

opt.backup = false -- does NOT create backup file
opt.clipboard = "unnamedplus" -- allows Neovim to use system clipboard
opt.fileencoding = "utf-8" -- sets the encoding of the file

-- opt.ignorecase = false -- search results needs to be case sensitive
opt.ignorecase = true -- search results does NOT needs to be case sensitive

opt.mouse = "a" -- allows for mouse navigation

-- Appearance

opt.cmdheight = 0 -- space for Neovim Command Line ( in this case NO space )
opt.conceallevel = 0 -- will show `` in markdown files
opt.hlsearch = true -- will highlight all matches on previous search
opt.pumheight = 10 -- the pop up menu height ( idk need to play with the number )
opt.pumblend = 10 -- works in conjuction `opt.pumheight`
-- opt.showmode = true -- Shows "NORMAL", "INSERT", "VISUAL" modes in cmd line ( needs to put `opt.cmdheight` to anyvalue expect '0' )
opt.showmode = false -- Does NOT show "NORMAL", "INSERT", "VISUAL" modes in cmd line
opt.showtabline = 1 -- Always show tabs ?

