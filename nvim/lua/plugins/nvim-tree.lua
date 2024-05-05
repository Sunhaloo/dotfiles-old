return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        view = {
            width = 35,
            relativenumber = true,
        },
        renderer = {
            indent_markers = {
                enable = true,
            }
        },
    }
    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
  end,
}
