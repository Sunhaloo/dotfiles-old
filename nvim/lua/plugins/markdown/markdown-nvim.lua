return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
	{
		"bullets-vim/bullets.vim",
		config = function()
			vim.g.bullets_delete_last_bullet_if_empty = 1
		end,
	},
}
