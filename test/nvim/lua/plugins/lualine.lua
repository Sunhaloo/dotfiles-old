return {
  {
    -- plugin that customises the command line area / bottom bar
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons" },
    -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
    event = "VeryLazy",
    -- configuration for 'lualine'
    config = function()
      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
        },
        -- active window --> sections settings
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            -- git branches
            { "branch" },
            -- git diffs
            {
              "diff",
              -- add custom symbols to 'diff' changes
              symbols = {
                added = "+ ",
                modified = " ",
                removed = " ",
              },
            },
            -- LSP diagnostics
            { "diagnostics" },
          },
          lualine_c = {
            -- filename... Duhh!
            {
              "filename",
              -- add custom symbols to 'filename' based on ( see below )
              symbols = {
                modified = "",
                readonly = "",
                unnamed = "",
                newfile = "",
              },
            },
          },
          -- lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_x = {
            -- encoding options
            {
              "encoding",
              show_bomb = true,
            },
            -- format of the file that is being worked on
            { "fileformat" },
            -- well type of the file ==> 'filetype'
            {
              "filetype",
              -- WARNING: currently now working as I am using 'mini.icons' ==> still needs configuration
              icon_only = true,
            },
          },
          -- lualine_y = {"location"},
          -- trying it out without the 'location'
          lualine_y = {},
          lualine_z = {
            -- date
            {
              "datetime",
              -- supports `strftime` options from Python's 'datetime.datetime' module
              style = "%d/%m/%Y",
            },
          },
        },
        -- inactive window --> sections settings
        inactive_sections = {
          lualine_a = { bruh },
          lualine_b = {},
          -- same as the "active" one
          lualine_c = {
            {
              "filename",
              -- add custom symbols to 'filename' based on ( see below )
              symbols = {
                modified = "",
                readonly = "",
                unnamed = "",
                newfile = "",
              },
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}
