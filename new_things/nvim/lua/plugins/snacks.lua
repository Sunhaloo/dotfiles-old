return {
	-- combination of some great plugins made by the man himself... Folke
	"folke/snacks.nvim",
	priority = 1000,
	-- plugin IS loaded in immediately during startup
	lazy = false,
	-- start on these 2 events
	event = { "BufReadPre", "BufNewFile" },

	-- actual configuration for 'snacks'
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

		-- enabled "mini" / individual plugins
		-- ability to view images inside of Neovim
		image = { enabled = true },

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
					horizontal = "─",
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
			win = { style = "float" },
		},

		-- key mappings configuration for each individual plugins
		keys = {
			-- toggle terminal ==> finally, I can remove 'toggleterm.nvim' ( did server me very well )
			{
				-- "<C-/>",
				"<leader>ft",
				function()
					Snacks.terminal()
				end,
				-- Apply to both normal and terminal modes
				desc = "Toggle Floating Terminal [ Snacks ]",
			},
		},
	},
}
