return {
  "folke/snacks.nvim",
  opts = {
    -- configure the styles for the pickers
    styles = {
      -- set up the floating layout
      float = {
        -- make the borders look more modern
        border = "rounded",
      },
    },

    -- disabled "mini" / individual plugins
    animate = { enabled = false },
    bigfile = { enabled = false },
    dashboard = { enabled = false },

    -- basicially indent-guides for tabbings
    indent = {
      enabled = true,
      -- disable animations for indentation
      animate = { enabled = false },
      -- configure when / how the indentation is going to show up
      indent = {
        -- show all the indentation guide on position of caret
        only_scope = false,
        -- change the colours of the each indentation
        -- hl = {
        -- 	"SnacksIndent1",
        -- 	"SnacksIndent2",
        -- 	"SnacksIndent3",
        -- 	"SnacksIndent4",
        -- 	"SnacksIndent5",
        -- 	"SnacksIndent6",
        -- 	"SnacksIndent7",
        -- 	"SnacksIndent8",
        -- },
      },

      chunk = {
        -- when enabled, scopes will be rendered as chunks, except for the
        -- top-level scope which will be rendered as a scope.
        enabled = true,
        -- only show chunk scopes in the current window
        only_current = false,
        priority = 200,
        hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "",
          vertical = "│",
          arrow = "",
        },
      },
    },

    -- basically a telescope replacement
    picker = {
      enabled = true,
      -- what is shown where next to the caret
      -- how the "searching algorithm" works
      matcher = {
        -- WARNING: bonuses options has performance impact

        -- give me priority to files accessed in chronological order
        history_bonus = true,
      },
    },

    -- basically better nvim-notify
    notifier = {
      enabled = true,
      -- change the style of the notification popup
      style = "fancy",
    },

    -- renders file as quickly as possible before loading plugins
    quickfile = { enabled = true },

    -- beautify the status column
    statuscolumn = {
      enabled = true,
    },

    -- snacks own terminal "emulator"
    terminal = {
      enabled = true,
      -- setup terminal to become float
      win = { style = "terminal" },
    },
  },

  keys = {
    -- find all recently used files
    {
      "<leader>fo",
      function()
        Snacks.picker.recent({
          -- change the layout to "select"
          layout = "select",
        })
      end,
      desc = "Find Old Files [ Snacks ]",
    },

    -- live grep ==> search for specific word in file
    {
      "<leader>fl",
      function()
        Snacks.picker.grep({
          -- change the layout to "telescope"
          layout = "telescope",
        })
      end,
      desc = "Live Grep [ Snacks ]",
    },

    -- search and select configuration files present in the `~/.config` directory
    {
      "<leader>fC",
      function()
        Snacks.picker.files({
          -- search for files only on the `~/.config` directory
          cwd = vim.fn.expand("$HOME/.config/"),
          -- change the layout to "telescope"
          layout = "telescope",
        })
      end,
      desc = "Find Config Files [ Snacks ]",
    },

    -- find all the "callouts" comment in a code / markdown document
    {
      "<leader>ft",
      function()
        Snacks.picker.todo_comments({
          -- change the layout to "telescope"
          layout = "telescope",
        })
      end,
      desc = "Highlighted Comments [ Snacks ]",
    },

    -- search and select obsidian files present in the vault
    {
      "<leader>fO",
      function()
        Snacks.picker.files({
          -- search for files only on the `~/Obsidian/S.Sunhaloo/` directory
          cwd = vim.fn.expand("$HOME/Obsidian/S.Sunhaloo/"),
          -- change the layout to "sidebar"
          layout = "sidebar",
          on_show = function()
            vim.cmd.stopinsert()
          end,
        })
      end,
      desc = "Find Obsidian Files [ Snacks ]",
    },

    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit [ Snacks ]",
    },

    {
      "<leader>I",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons [ Snacks ]",
    },

    {
      "<leader>hl",
      function()
        Snacks.picker.highlights({
          -- change the layout to "vertical"
          layout = "vertical",
        })
      end,
      desc = "Icons [ Snacks ]",
    },

    {
      "<leader>fh",
      function()
        Snacks.picker.help({
          -- change the layout to "sidebar"
          layout = "sidebar",
        })
      end,
      desc = "Help Pages [ Snacks ]",
    },
  },
}
