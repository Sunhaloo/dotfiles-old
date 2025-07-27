return {
	{
		-- lovely / better solarize theme by the crafter devaslife
		"craftzdog/solarized-osaka.nvim",
		-- plugin IS loaded in immediately during startup
		lazy = false,
		-- make sure that other UI elements start with the theme
		priority = 1000,
		-- configuration for 'solarized-osaka'
		config = function()
			require("solarized-osaka").setup({
				-- toggle transparency
				transparent = true,
				-- use colours from terminal
				terminal_colors = true,
			})
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
}
