return {
	{
		-- lua package manager for neovim
		"vhyrro/luarocks.nvim",
		-- run plugin before anything else
		priority = 1001,
	},
	{
		"3rd/image.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("image").setup({
				backend = "kitty",
				kitty_method = "normal",
				max_height_window_percentage = 30,
				tmux_show_only_in_active_window = true,
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = true,
						-- online images / image from URLs
						download_remote_images = true,
						only_render_image_at_cursor = true,
					},
					html = {
						enabled = true,
						clear_in_insert_mode = true,
						-- online images / image from URLs
						download_remote_images = true,
						only_render_image_at_cursor = true,
					},
				},
			})
		end,
	},
}
