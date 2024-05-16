-- highlight TODOs, NOTEs, etc

return {
	'folke/todo-comments.nvim',
	event = 'VimEnter',
	dependencies = { 'nvim-lua/plenary.nvim' },
	-- opts = { signs = false },
	config = function()
		require('todo-comments').setup({
			opts = {
				signs = false,
			},
		})
		vim.keymap.set('n', '<leader>st', vim.cmd.TodoTelescope, { desc = '[S]earch [T]odos' })
		-- vim.keymap.set('n', '<leader>st', require('todo-comments').todotelescope, { desc = '[S]earch [T]odos' })
	end,
}

