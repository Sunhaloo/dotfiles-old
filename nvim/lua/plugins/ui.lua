-- place where I will store all the config file related to Neovim's UI
return {
    -- cursor column thing plugin
    { 
        "lukas-reineke/virt-column.nvim",
        opts = {
            -- use the character '|' as the column character
            char = { "|" },
            -- most programmers / programming langugaes asked that word count
            -- should not be greater than 80 ( something something ) in a line
            virtcolumn = "80",
            -- change the colour of the character that is used
            -- use the command `highlight` in neovim to see bunch of colours
            highlight = { "StatusLineNC" }
        }
    },
    -- which key plugin
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
          -- basically 'classic' style with borders and floating
          preset = "modern",
      },
      -- keymap to show the ( full ) keys for which-key
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    -- zen mode plugin
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
                  laststatus = 0,
                  -- removes the command we are doing
                  -- command like `diw`, `ciw` and more will now be shown
                  showcmd = false
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
    },
    -- bufferline plugin
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
}