-- easier lua stuff
vim.keymap.set('n', '<leader>X', "<cmd>source % | echo 'sourced the file'<CR>", { desc = 'Source the current file' })
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'Source the current line of lua code' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Source the selected lua code' })

-- clipboard (unneeded if clipboard is unnamedplus in options.lua)
-- hidden by which-key
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>d', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set('n', '<leader>yy', '"+yy', { desc = 'Copy line to clipboard' })
vim.keymap.set('n', '<leader>dd', '"+dd', { desc = 'Cut line to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Paste from clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('v', '<leader>d', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('v', '<leader>P', '"+P', { desc = 'Paste from clipboard' })

-- diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- exit terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- window nav
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Quickfix keymaps
-- ctrl-q cnext cprev
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Go to previous in the [Q]uickfix list' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Go to next in the [Q]uickfix list' })

-- tabs
vim.keymap.set('n', '<leader>tb', '<C-w>T', { desc = 'Break out current buffer to new tab' })
vim.keymap.set('n', '<leader>tB', '<C-w>TgT', { desc = 'Break out current buffer to new tab without changing focus' })
vim.keymap.set('n', '<leader>ts', '<cmd>tab split<CR>', { desc = 'Split the current buffer to a new tab' })
vim.keymap.set(
	'n',
	'<leader>tS',
	'<cmd>tab split<CR>gT',
	{ desc = 'Split the current buffer to a new tab without changing focus' }
)
vim.keymap.set('n', '<leader>tn', vim.cmd.tabNext, { desc = 'Next tab (gt)' })
vim.keymap.set('n', '<leader>tp', vim.cmd.tabPrevious, { desc = 'Previous tab (gT)' })

-- if hlsearch is true enable this
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- terminal stuffs
-- NOTE: i still don't think this completely works
local open_term = function(termName)
	if vim.api.nvim_buf_is_loaded(termName) then
		vim.cmd.b(termName)
		return termName
	else
		vim.cmd.term()
		return vim.api.nvim_buf_get_number(0)
	end
end

local termBuffer = -1
vim.keymap.set('n', '<leader>oT', function()
	vim.cmd.tabnew()
	termBuffer = open_term(termBuffer)
end, { desc = 'Open terminal in a new tab' })
vim.keymap.set('n', '<leader>ot', function()
	vim.cmd.vs()
	termBuffer = open_term(termBuffer)
end, { desc = 'Open terminal in a vertical split' })
