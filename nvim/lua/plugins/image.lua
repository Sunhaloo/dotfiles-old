return {
	{
		"3rd/image.nvim",
		event = "VeryLazy",
		config = function()
			require("image").setup({
				backend = "kitty",
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = true,
						only_render_image_at_cursor = true
					},
					html = {
						enabled = true,
						clear_in_insert_mode = true,
						only_render_image_at_cursor = true
					},
				},
			})
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		config = function()
			require("img-clip").setup({})
		end,
	},
}
