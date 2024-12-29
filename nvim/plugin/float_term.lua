-- variable to keep track of the "window" state
local state = {
    -- create a table
    floating = {
        buf = -1,
        win = -1
    }
}

-- code provided by ChatGPT
local function create_floating_window(opts)
    -- Get screen dimensions
    local screen_width = vim.o.columns
    local screen_height = vim.o.lines

    -- Determine width and height of the floating window
    local width = opts and opts.width or math.floor(screen_width * 0.8)
    local height = opts and opts.height or math.floor(screen_height * 0.8)

    -- Calculate the starting position (row and col) to center the window
    local row = math.floor((screen_height - height) / 2)
    local col = math.floor((screen_width - width) / 2)

    -- create a buffer in the window
    local buf = nil
    -- check if there is anything in that buffer
    if vim.api.nvim_buf_is_valid(opts.buf) then
        -- then keep the contents of the buffer
        buf = opts.buf
    -- if there is nothing in the buffer
    else
        -- create the buffer
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end


    -- Set the floating window options
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor", -- Floating relative to the editor
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal", -- No borders or UI elements
        border = "rounded", -- Optional: rounded borders
    })

    -- update the return to use table
    return { buf = buf, win = win }
end

-- create a function for toggle-able terminal
local toggle_term = function ()
    -- create a new floating window if not created
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        -- create the window and pass the previous buffer
        -- I think if we don't pass the previous buffer, it will just a "new" one
        state.floating = create_floating_window { buf = state.floating.buf }
        -- check if the current buffer created is a "terminal"
        -- NOTE: `~=` is "Not Equal To" ( `!=` this seems more intuitive )
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            -- create the terminal in that buffer by calling the command
            vim.cmd.term()
            vim.cmd("startinsert")
        end
    -- if the window is already open ==> hide it
    else
        -- hide the window
        vim.api.nvim_win_hide(state.floating.win)
    end
end

-- create a Neovim user-command that can be run in the command line ( similar to auto-command )
vim.api.nvim_create_user_command("FloatingTerminal", toggle_term, {})

-- create the default 'toggleterm.nvim' keymaps for terminal
vim.keymap.set({'n', 't'}, "<C-/>", "<Cmd>FloatingTerminal<CR>")
