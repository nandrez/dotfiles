-- LEADER KEY
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NAVIGATION
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Go to [N]ext buffer' })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = 'Go to [P]revious buffer' })
