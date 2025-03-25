return {
	{
		-- combination of some great plugins made by the man himself... Folke
		"folke/snacks.nvim",
		priority = 1000,
		-- plugin IS loaded in immediately during startup
		lazy = false,
		-- configuration options
		opts = {
			-- configure the styles for the pickers
			styles = {
				-- setup the scratch layout
				scratch = {
					-- use a more minimal appearance
					-- minimal = true,
					-- change the dimension of the scratchpad
					width = 150,
					height = 35,
				},
                -- set up the floating layout
                float = {
                    border = "rounded",
                }
			},

			-- basically snacks animation library
			animate = {
				enabled = true,
				-- duration of entire animation in miliseconds
				duration = 10,
				-- easing function ==> please refer to 'https://easings.net'
				easing = "inElastic",
				-- global FPS settings for all other animations
			},

			-- prevents LSP, Treesitter, etc to attach to really large files
			bigfile = {
				enable = true,
				-- configure size of file ( in bytes --> converting to megabytes )
				size = 0.8 * 1024 * 1024,
			},

			-- dashboard setup
			-- INFO: you need to have 'chafa' installed on your system
			dashboard = {
				-- enable the dashboard plugin
				enabled = true,
				-- what to show on the dashboard
				sections = {
					-- display an image
					{
						section = "terminal",
						cmd = "chafa $HOME/Wallpapers/5.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
						padding = 1,
						-- set the correct height for the image being used
						height = 16,
					},
					{
						-- make the image side by side instead of top to bottom
						pane = 2,
						-- shows the whatever header --> can be configured below
						{ section = "header" },
						-- show the keymappings we customised below
						{ section = "keys", gap = 1, padding = 1 },
						-- display the startup time
						{ section = "startup" },
					},
				},
				-- what will be shown for the keymappings text
				preset = {
					-- customise the keymappings found on dashboard
					keys = {
						-- keymappings for finding files in directory
						{
							icon = " ",
							key = "f",
							desc = "Find Files",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						-- keymappings for creation of a new file in directory
						{
							icon = " ",
							key = "n",
							desc = "New File",
							action = ":ene | startinsert",
						},
						-- keymappings for live grep in directory
						{
							icon = " ",
							key = "l",
							desc = "Live Grep",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						-- keymappings for help documentation
						{
							icon = "? ",
							key = "h",
							desc = "Help Documentation",
							action = ":lua Snacks.dashboard.pick('help_tags')",
						},
						-- keymappings for finding recently used files
						{
							icon = " ",
							key = "o",
							desc = "Find Old Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						-- keymappings for finding system configuration files
						{
							icon = " ",
							key = "c",
							desc = "System Config Files",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.expand('$HOME/.config')})",
						},
						-- keymappings for quiting neovim
						{
							icon = " ",
							key = "q",
							desc = "Quit",
							action = "<Cmd>qa<CR>",
						},
					},
					-- the header "string" for neovim
					header = [[Testing]],
				},
			},

			-- abitilty to view images in neovim
			-- WARNING: will be configured later
			image = {
				enabled = true,
			},

			--  provides indentation guides
			indent = {
				enabled = true,
				-- only show the indentation guide on position of caret
				indent = {
					only_scope = true,
				},
			},

			-- basically a telescope replacement
			picker = {
				enabled = true,
				-- what is shown where next to the caret
				prompt = "󰘧 ",
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

			-- similar to a tiling window manager's scratchpad
			scratch = {
				-- function to create the file name for the scratchpad
				name = "scratch_" .. vim.fn.strftime("%d_%m_%Y-%H-%M-%S"),

				enabled = true,
				-- change the scratchpad save directory
				-- INFO: origianal directory is `vim.fn.stdpath("data") .. "/scratch"`
				root = vim.fn.expand("~/Neovim Scratch Buffers"),
			},

			-- animation for scrolling
			scroll = {
				enabled = true,
				-- change the animation
				easing = "inCirc",
			},

			-- beautify the status column
			-- BUG: not working
			statuscolumn = {
				enabled = true,
			},

            -- snacks own terminal "emulator"
            terminal = {
                enabled = true,
                -- setup terminal to become float
                win = { style = "float" }
            }
		},

		-- keymappings for snacks.nvim's "sub-plugins"
		keys = {
			{
				"<leader>e",
				function()
					Snacks.picker.explorer()
				end,
				desc = "Find All Files [ Snacks ]",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers({
						layout = "select",
						on_show = function()
							vim.cmd.stopinsert()
						end,
					})
				end,
				desc = "Find All Files [ Snacks ]",
			},
			{
				"<leader>fa",
				function()
					Snacks.picker.smart()
				end,
				desc = "Find All Files [ Snacks ]",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files [ Snacks ]",
			},
			{
				"<leader>fo",
				function()
					Snacks.picker.recent()
				end,
				desc = "Find Old Files [ Snacks ]",
			},
			{
				"<leader>fl",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live Grep [ Snacks ]",
			},
			{
				"<leader>I",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons [ Snacks ]",
			},
			{
				"<leader>fC",
				function()
					Snacks.picker.files({ cwd = vim.fn.expand("$HOME/.config/") })
				end,
				desc = "Find Config Files",
			},

			{
				"<leader>ft",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "Highlighted Comments [ Snacks ]",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages [ Snacks ]",
			},
			{
				"<leader>fm",
				function()
					Snacks.picker.man()
				end,
				desc = "Linux Man Pages [ Snacks ]",
			},
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>fO",
				function()
					Snacks.picker.files({ layout = "ivy", cwd = vim.fn.expand("$HOME/Obsidian/S.Sunhaloo/") })
				end,
				desc = "Find Obsidian Files",
			},

			{
				"<leader>gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "LSP Definitions",
			},
			{
				"<leader>gD",
				function()
					Snacks.picker.lsp_declaration()
				end,
				desc = "LSP Declarations",
			},
			{
				"<leader>gR",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "LSP References",
			},
			{
				"<leader>gi",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "LSP Type Definitions",
			},
			{
				"<leader>d",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "LSP Diagnostics",
			},
			{
				"<leader>D",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "LSP Buffer Diagnostics",
			},

			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications [ Snacks ]",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},

			{
				"<leader>gO",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
			},
			{
				"<leader>gF",
				function()
					Snacks.gitbrowse.open()
				end,
				desc = "Git Browse - File",
			},

			{
				"<leader>S",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratchpad",
			},
			{
				"<leader>Sl",
				function()
					Snacks.scratch.select()
				end,
				desc = "List Scratchpad",
			},



            {
                "<c-/>",
                function()
                    Snacks.terminal.toggle()
                end,
                mode = { "n", "t" }, -- Apply to both normal and terminal modes
                desc = "Toggle Snacks Terminal",
            },
		},
	},
}
