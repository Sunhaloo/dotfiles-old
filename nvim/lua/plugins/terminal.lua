-- variable that will truncate `vim.keymap`
local key = vim.keymap

-- create the auto-command that will be used to setup appearance of terminal
vim.api.nvim_create_autocmd("TermOpen", {
    -- create the group ( to avoid duplication with `clear = true` )
    group = vim.api.nvim_create_augroup("Terminal Settings", { clear = true }),

    -- create the callback function
    callback = function()
        -- set the settings for terminal ( window )
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- create a horizontal terminal
key.set('n', "<leader>ht", function()
    -- create a new window ( empty buffer )
    vim.cmd.vnew()
    -- run the command to open Neovim terminal
    vim.cmd.term()
    -- place the window at the bottom ( with terminal buffer open )
    vim.cmd.wincmd("J")
    -- set the height for terminal ( adjust for your screen size and resolution )
    vim.api.nvim_win_set_height(0, 15)
end,
    {
        desc = "Open Hortizontal Terminal"
    }
)

-- return "nothing" ==> suppresses lazy's annoying 'spec' message
return {}
