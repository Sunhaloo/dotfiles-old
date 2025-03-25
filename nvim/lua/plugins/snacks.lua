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
					-- change the dimension of the scratchpad
					width = 150,
					height = 35,
				},
                -- set up the floating layout
                float = {
                    -- make the borders look more modern
                    border = "rounded",
                },
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
            -- << Searching and Picking Files >>


            -- open file explorer
			{
				"<leader>e",
				function()
					Snacks.picker.explorer({
                        -- change the layout to "vertical"
                        layout = "vertical"
                    })
				end,
				desc = "Find All Files [ Snacks ]",
			},

            -- buffer picker
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers({
                        -- change the layout to "select"
						layout = "select",
                        -- start in 'NORMAL' mode instead of 'INSERT' mode
						on_show = function()
							vim.cmd.stopinsert()
						end,
					})
				end,
				desc = "Find Buffers [ Snacks ]",
			},

            -- search and select file ( smartly?!? )
			{
				"<leader>fa",
				function()
					Snacks.picker.smart()
				end,
				desc = "Find ( Smart ) Files [ Snacks ]",
			},

            -- search and select file just like in telescope
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files [ Snacks ]",
			},

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
                        layout = "telescope"
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
                        layout = "telescope"
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
                        layout = "telescope"
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
                        layout = "sidebar"
                    })
				end,
				desc = "Find Obsidian Files [ Snacks ]",
			},


            -- << Git Stuffs >>

            -- well, what can I say... 'lazygit' inside of neovim!
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit [ Snacks ]",
			},

            -- 
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files({
                        -- change the layout to "telescope"
                        layout = "telescope"
                    })
				end,
				desc = "Find Git Files [ Snacks ]",
			},

            -- basically open the local repository ( at main ) on the web browser ( if remote repos is present )
            -- NOTE: some pretty cool shit
			{
				"<leader>gO",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse [ Snacks ]",
			},

            -- basically open the local repository ( at that specific file ) on the web browser ( if remote repos is present )
            -- NOTE: again, some pretty cool shit
			{
				"<leader>gF",
				function()
					Snacks.gitbrowse.open()
				end,
				desc = "Git Browse - File [ Snacks ]",
			},


            -- << Terminal >>


            -- toggle terminal ==> finally, I can remove 'toggleterm.nvim' ( did server me very well )
            {
                "<c-/>",
                function()
                    Snacks.terminal.toggle()
                end,
                mode = { "n", "t" }, -- Apply to both normal and terminal modes
                desc = "Toggle Snacks Terminal",
            },


            -- << Coding >>


            -- << LSP Related Stuff >>
			{
				"<leader>gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "LSP Definitions [ Snacks ]",
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
					Snacks.picker.diagnostics({
                        -- change the layout to "telescope"
                        layout = "telescope"
                    })
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

            -- find help documentation related to neovim and installed plugins
			{
				"<leader>fh",
				function()
					Snacks.picker.help({
                        -- change the layout to "sidebar"
                        layout = "sidebar"
                    })
				end,
				desc = "Help Pages [ Snacks ]",
			},

            -- general 'man page' finder but also in neovim
			{
				"<leader>fm",
				function()
					Snacks.picker.man({
                        -- change the layout to "sidebar"
                        layout = "sidebar"
                    })
				end,
				desc = "Linux Man Pages [ Snacks ]",
			},


            -- << Miscellaneous >>

            -- IDK when I am going to need this... Buts its here!
			{
				"<leader>I",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons [ Snacks ]",
			},

            -- again, IDK when I am going to needs this... Butt ))!
			{
				"<leader>hl",
				function()
					Snacks.picker.highlights({
                        -- change the layout to "vertical"
                        layout = "vertical"
                    })
				end,
				desc = "Icons [ Snacks ]",
			},

            -- hide the annoying fucking, repetitive notifications
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications [ Snacks ]",
			},

            -- find and select projects
			{
				"<leader>fp",
				function()
					Snacks.picker.projects({
                        -- change the layout to "select"
                        layout = "select"
                    })
				end,
				desc = "Projects [ Snacks ]",
			},

            -- create a Scratchpad for you to dump stuff
			{
				"<leader>S",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratchpad [ Snacks ]",
			},
			{
				"<leader>Sl",
				function()
					Snacks.scratch.select()
				end,
				desc = "List Scratchpad [ Snacks ]",
			},
		},
	},
}
