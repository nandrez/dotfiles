return {
	--- Telescope is a highly customizable fuzzy finder that supports extensions.
	-- In order to use its grepping functionality, 'ripgrep' (https://formulae.brew.sh/formula/ripgrep) is required
	-- See https://github.com/nvim-telescope/telescope.nvim for more details
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({}),
					},
				},
			})
			pcall(telescope.load_extension, 'fzf')
			pcall(telescope.load_extension, 'ui-select')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sgf', builtin.git_files, { desc = '[S]earch [G]it [F]iles' })
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			local notify_extension = telescope.extensions.notify
			vim.keymap.set('n', '<leader>sn', notify_extension.notify, { desc = '[S]earch [N]otifications' })
		end,
	},
}
