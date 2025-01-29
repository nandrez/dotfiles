return {
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		lazy = false,
		opts = {
			style = 'night',
			light_style = 'day',
			transparent = true,
		},
		config = function()
			vim.cmd.colorscheme('tokyonight-night')
		end,
	},
}
