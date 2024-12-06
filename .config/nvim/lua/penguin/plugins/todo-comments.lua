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
		vim.keymap.set('n', '<leader>st', vim.cmd.TodoTelescope, { desc = 'Search TODOs' })
	end,
}
