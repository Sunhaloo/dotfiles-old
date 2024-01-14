-- Bootstrap Lazy by folke

-- From what I understand; it is trying to find "~/.local/share/nvim" folder
-- ".." means to concatenate in Lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Adding lazy.nvim

-- Configure Options and Plugins
require("lazy").setup({

  spec = {

    {
      "LazyVim/LazyVim",
      -- Folder where all the plugins are installed ( I think )
      import = "lazyvim.plugins",
      opts = {

        -- Theme Settings
        colorscheme = "onedark",

      },
    },

    ui = {

      -- Rounded Borders
      border = "rounded",

    },

    change_detection = {

      enabled = true,
      -- Disable Messages / Notifications
      notify = false,

    },

    { import = "plugins" },

  },

})
