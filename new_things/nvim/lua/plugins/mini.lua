return {
	{
		-- choosing 'mini.pairs' and testing it ( over 'nvim-autopairs' )
		"echasnovski/mini.pairs",
		version = false,
		-- start on when in Insert Mode
		event = "InsertEnter",

		-- configuration for 'mini.pairs'
		config = function()
			-- enable the autopairs plugin
			require("mini.pairs").setup({
				mappings = {
					-- create autopairs for '<>' as mini.pairs does not come with that
					["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
					[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
				},
			})
		end,
	},
}
