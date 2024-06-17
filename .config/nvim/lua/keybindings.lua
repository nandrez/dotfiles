-- LEADER KEY
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function bind(mode, key, command, description)
	vim.keymap.set(mode, key, command, { desc = description, silent = true })
end

-- NAVIGATION
bind('n', '<leader>bn', ':bnext<CR>', 'Go to [N]ext buffer')
bind('n', '<leader>bp', ':bprev<CR>', 'Go to [P]revious buffer')

-- SEARCH
bind('n', '?', ':noh<CR>', 'Clear search highlighting')
