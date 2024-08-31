return {
    {
      "folke/zen-mode.nvim",
      opts = {
          window = {
              backdrop = 0.30,
              width = 120,
              height = 1,
              -- Neovim built-in UI options
              options = {
                  relativenumber = true,
                  cursorline = false,
                  cursorcolumn = false
              },
          },
          plugins = {
              -- futher options
              options = {
                  -- enabled the 'futher options'
                  enabled = true,
                  -- removes the status line
                  laststatus = 0
              },
              -- remove status line from tmux
              tmux = { enabled = true },
              -- terminal settings
              kitty = {
                  enabled = true,
                  font = "+4",
              },
          },
      }
    }
}
