return {
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					hide_gitignored = true,
					hide_dotfiles = false,
					hide_by_name = {
						'.github',
						'.gitignore',
						'package-lock.json',
						'.changeset',
						'.prettierrc.json',
					},
					never_show = {
						'.git',
						'.DS_Store',
					},
				},
			},
		},
		config = function(_, opts)
			require('neo-tree').setup(opts)
			vim.keymap.set('n', '<leader>ft', ':Neotree<CR>', {})
		end,
	},
}
