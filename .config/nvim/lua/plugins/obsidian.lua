return {
	'epwalsh/obsidian.nvim',
	version = '*', -- latest release
	lazy = true,
	ft = 'markdown',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'folke/which-key.nvim',
	},
	opts = {
		-- see https://github.com/epwalsh/obsidian.nvim/tree/main?tab=readme-ov-file#notes-on-configuration
		workspaces = {
			{
				name = 'SecondBrain',
				path = '~/Documents/SecondBrain/',
			},
		},
		templates = {
			folder = '~/Documents/SecondBrain/99_Config/ObsidianTemplates/',
		},
		notes_subdir = '/00_Inbox',

		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			['<leader>ch'] = {
				action = function()
					return require('obsidian').util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			['<cr>'] = {
				action = function()
					return require('obsidian').util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		new_notes_location = 'current_dir', -- [current_dir|notes_subdir]

		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ''
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. '-' .. suffix
		end,

		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			local path = spec.dir / tostring(spec.title)
			return path:with_suffix('.md')
		end,

		-- Frontmatter customisation
		---@param note obsidian.Note
		---@return table
		note_frontmatter_func = function(note)
			if note.title then
				note:add_alias(note.title)
			end

			local frontmatter = { id = note.id, aliases = note.aliases, tags = note.tags }
			frontmatter['created'] = os.date('%Y-%m-%d', os.time())

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					frontmatter[k] = v
				end
			end

			return frontmatter
		end,
	},

	init = function()
		local which_key = require('which-key')
		which_key.add({
			{ '<leader>o', group = '[O]bsidian' },
		})
	end,

	keys = {
		{
			'<leader>on',
			'<cmd>ObsidianNew<cr>',
			desc = '[N]ew note',
		},
		{
			'<leader>oo',
			'<cmd>ObsidianOpen<cr>',
			desc = '[O]pen note',
		},
		{
			'<leader>or',
			'<cmd>ObsidianRename<cr>',
			desc = '[R]ename note',
		},
		{
			'<leader>ox',
			'<cmd>ObsidianExtractNote<cr>',
			desc = 'e[X]tract selection into new note',
		},
		{
			'<leader>of',
			group = '[F]ollow link',
		},
		{
			'<leader>ofv',
			'<cmd>ObsidianFollowLink vsplit<cr>',
			desc = 'Open link in [V]ertical split',
		},
		{
			'<leader>ofh',
			'<cmd>ObsidianFollowLink hsplit<cr>',
			desc = 'Open link in [H]orizontal split',
		},
		{
			'<leader>ob',
			'<cmd>ObsidianBacklinks<cr>',
			desc = '[B]acklinks to current note',
		},
		{
			'<leader>ol',
			'<cmd>ObsidianLinks<cr>',
			desc = '[L]inks within current note',
		},
	},
}
