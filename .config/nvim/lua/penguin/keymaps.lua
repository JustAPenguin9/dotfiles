local set = vim.keymap.set

-- easier lua stuff
set('n', '<leader>X', "<cmd>source % | echo 'sourced the file'<CR>", { desc = 'Source the current file' })
set('n', '<leader>x', ':.lua<CR>', { desc = 'Source the current line of lua code' })
set('v', '<leader>x', ':lua<CR>', { desc = 'Source the selected lua code' })

-- clipboard (unneeded if clipboard is unnamedplus in options.lua)
-- hidden by which-key
set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
set('n', '<leader>d', '"+d', { desc = 'Cut to clipboard' })
set('n', '<leader>yy', '"+yy', { desc = 'Copy line to clipboard' })
set('n', '<leader>dd', '"+dd', { desc = 'Cut line to clipboard' })
set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
set('n', '<leader>P', '"+P', { desc = 'Paste from clipboard' })
set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
set('v', '<leader>d', '"+d', { desc = 'Cut to clipboard' })
set('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
set('v', '<leader>P', '"+P', { desc = 'Paste from clipboard' })

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

-- tabs
set('n', '<leader>tb', '<C-w>T', { desc = 'Break out buffer to new tab' })
set('n', '<leader>ts', '<cmd>tab split<CR>', { desc = 'Split the current buffer to a new tab' })
set(
	'n',
	'<leader>tS',
	'<cmd>tab split<CR>gT',
	{ desc = 'Split the current buffer to a new tab without changing focus' }
)
set('n', '<leader>tn', vim.cmd.tabNext, { desc = 'Next tab (gt)' })
set('n', '<leader>tp', vim.cmd.tabPrevious, { desc = 'Previous tab (gT)' })

-- if hlsearch is true enable this
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- terminal stuffs
local open_term = function(termName)
	if vim.fn.bufexists(termName) == 1 then
		vim.cmd.b(termName)
	else
		vim.cmd.term()
		return vim.api.nvim_buf_get_name(0)
	end
end

local termBuffer
set('n', '<leader>tt', function()
	vim.cmd.tabnew()
	termBuffer = open_term(termBuffer)
end, { desc = 'Open terminal in a new tab' })
set('n', '<leader>ot', function()
	vim.cmd.vs()
	termBuffer = open_term(termBuffer)
end, { desc = 'Open terminal in a vertical split' })
