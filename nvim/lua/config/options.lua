-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Mouse is "Enable" by Default

-- Enable Mouse
vim.opt.mouse = "a"

-- Enable Spell Check
vim.opt.spell = true

-- Undercurl  ( more like Underlines )


-- Start Undercurls
--vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- Stop Undercurls
--vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Alternative Method From ChatGPT
vim.cmd([[let &t_Ce = "\e[4m"]])
vim.cmd([[let &t_Ce = "\e[0m"]])
