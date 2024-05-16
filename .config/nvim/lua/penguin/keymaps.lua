local set = vim.keymap.set

-- diagnostic
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- exit terminal
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- window nav
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Quickfix keymaps
-- ctrl-q cnext cprev
set('n', '[q', vim.cmd.cprev, { desc = 'Go to previous in the [Q]uickfix list' })
set('n', ']q', vim.cmd.cnext, { desc = 'Go to next in the [Q]uickfix list' })

-- if hlsearch is true enable this
-- set('n', '<Esc>', '<cmd>nohlsearch<CR>')
