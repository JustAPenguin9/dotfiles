local set = vim.keymap.set

-- easier lua stuff
set("n", "<leader>x", "<cmd>source % | echo 'sourced the file'<CR>", { desc = "Source the current file" })

-- inc dec numbers
-- ctrl-x/a
set("n", "<leader>[", "<C-x>", {desc = "Decremnt the number at the cursor"})
set("n", "<leader>]", "<C-a>", {desc = "Increment the number at the cursor"})

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
set('n', '<leader>tb', '<C-w>T', {desc = 'Break out split to new tab'})
set('n', '<leader>ts', '<cmd>tab split<CR>', {desc = 'Open current buffer in a new tab'})
set('n', '<leader>tn', vim.cmd.tabNext, {desc = 'Next tab (gt)'})
set('n', '<leader>tp', vim.cmd.tabPrevious, {desc = 'Previous tab (gT)'})

-- terminal stuffs
local termBuffer
set('n', '<leader>tt', function ()
	vim.cmd.tabnew()
	if termBuffer then
		vim.cmd.b(termBuffer)
	else
		vim.cmd.term()
		termBuffer = vim.api.nvim_buf_get_name(0)
	end
end, {desc = 'Open terminal in a new tab'})
set('n', '<leader>ot', function ()
	vim.cmd.vs()
	if termBuffer then
		vim.cmd.b(termBuffer)
	else
		vim.cmd.term()
		termBuffer = vim.api.nvim_buf_get_name(0)
	end
end, {desc = 'Open terminal in a vertical split'})

-- if hlsearch is true enable this
set('n', '<Esc>', '<cmd>nohlsearch<CR>')
