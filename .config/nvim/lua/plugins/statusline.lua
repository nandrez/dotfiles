return {
	--- Status line plugin displaying various components, like file-type or file-encoding
	-- See https://github.com/nvim-lualine/lualine.nvim for more info.
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = 'tokyonight',
			},
		},
	},
}
