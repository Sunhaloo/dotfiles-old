-- variable that will truncate `vim.keymap`
local key = vim.keymap

-- give an initial state for the window and buffer
local state = {
    -- initial state for horizontal terminal
    horizontal_term = {
        buf = -1,
        win = -1
    },
    -- initial state for vertical terminal
    vertical_term = {
        buf = -1,
        win = -1
    }
}

-- function / code provided by ChatGPT for horizontal window
local function create_horizontal_window(opts)
    -- get the dimensions of the current Neovim window ==> screen dimensions
    -- NOTE: "Terminal Zoom" is also taken into account
    local screen_width = vim.o.columns
    local screen_height = vim.o.lines

    -- Determine the height of the window
    -- local height = opts and opts.height or math.floor(screen_height * 0.3) -- Default to 30% of screen height
    local height = opts and opts.height or math.floor(screen_height * 0.45) -- Default to 45% of screen height

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

    -- Open the window as a horizontal split
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = screen_width, -- Full width
        height = height,
        row = screen_height - height, -- Position at the bottom
        col = 0,
        style = "minimal",
        border = "none" -- Optional border for clarity
    })

    -- Return buffer and window handle
    return { buf = buf, win = win }
end

-- create a function for toggle-able terminal
local horizontal_terminal = function ()
    -- create a new floating window if not created
    if not vim.api.nvim_win_is_valid(state.horizontal_term.win) then
        -- create the window and pass the previous buffer
        -- I think if we don't pass the previous buffer, it will just a "new" one
        state.horizontal_term = create_horizontal_window { buf = state.horizontal_term.buf }
        -- check if the current buffer created is a "terminal"
        -- NOTE: `~=` is "Not Equal To" ( `!=` this seems more intuitive )
        if vim.bo[state.horizontal_term.buf].buftype ~= "terminal" then
            -- create the terminal in that buffer by calling the command
            vim.cmd.term()
            vim.cmd("startinsert")
        end
    -- if the window is already open ==> hide it
    else
        -- hide the window
        vim.api.nvim_win_hide(state.horizontal_term.win)
    end
end



-- function / code provided by ChatGPT for vertical window
local function create_vertical_window(opts)
    -- get the dimensions of the current Neovim window ==> screen dimensions
    -- NOTE: "Terminal Zoom" is also taken into account
    local screen_width = vim.o.columns
    local screen_height = vim.o.lines

    -- Determine the width of the window
    -- local width = opts and opts.width or math.floor(screen_width * 0.25) -- Default to 25% of screen width
    local width = opts and opts.width or math.floor(screen_width * 0.45) -- Default to 45% of screen width

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


    -- Open the window as a vertical split
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = screen_height, -- Full height
        row = 0,
        col = screen_width - width, -- Position on the right
        style = "minimal",
        border = "none" -- Optional border for clarity
    })

    -- Return buffer and window handle
    return { buf = buf, win = win }
end

-- create a function for toggle-able terminal
local vertical_terminal = function ()
    -- create a new floating window if not created
    if not vim.api.nvim_win_is_valid(state.vertical_term.win) then
        -- create the window and pass the previous buffer
        -- I think if we don't pass the previous buffer, it will just a "new" one
        state.vertical_term = create_vertical_window { buf = state.vertical_term.buf }
        -- check if the current buffer created is a "terminal"
        -- NOTE: `~=` is "Not Equal To" ( `!=` this seems more intuitive )
        if vim.bo[state.vertical_term.buf].buftype ~= "terminal" then
            -- create the terminal in that buffer by calling the command
            vim.cmd.term()
            vim.cmd("startinsert")
        end
    -- if the window is already open ==> hide it
    else
        -- hide the window
        vim.api.nvim_win_hide(state.vertical_term.win)
    end
end


-- create a Neovim user-command that can be run in the command line ( similar to auto-command )
vim.api.nvim_create_user_command("HTerm", horizontal_terminal, {})
-- create the default 'toggleterm.nvim' keymaps for horizontal terminal
key.set({'n', 't'}, "<leader>ht", "<Cmd>HTerm<CR>")

-- create a Neovim user-command that can be run in the command line ( similar to auto-command )
vim.api.nvim_create_user_command("VTerm", vertical_terminal, {})
-- create the default 'toggleterm.nvim' keymaps for horizontal terminal
key.set({'n', 't'}, "<leader>vt", "<Cmd>VTerm<CR>")
