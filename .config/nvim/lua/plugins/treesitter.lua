return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'markdown' },
			},
			indent = { enable = true },
			ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },
		},
	},
}
