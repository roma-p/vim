local map = vim.keymap.set

-- Space is the leader; keep it a no-op otherwise
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move by display line when wrapped, unless a count is given
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostics
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- Paste over selection without yanking the replaced text
map('x', '<leader>p', [["_dP]])

-- Exit terminal mode with double-escape
map('t', '<Esc><Esc>', [[<C-\><C-n>]], { silent = true })

-- Keep cursor centered on half-page jumps and search results
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '*', '*zzzv')
map('n', '#', '#zzzv')
