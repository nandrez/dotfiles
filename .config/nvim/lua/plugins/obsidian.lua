return {
	'epwalsh/obsidian.nvim',
	version = '*', -- latest release
	lazy = true,
	ft = 'markdown',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		-- see https://github.com/epwalsh/obsidian.nvim/tree/main?tab=readme-ov-file#notes-on-configuration
		workspaces = {
			{
				name = 'SecondBrain',
				path = '~/Documents/SecondBrain/',
			},
		},
	},
}
