-- keybind help

return {
	'folke/which-key.nvim',
	event = 'VimEnter',
	config = function()
		require('which-key').setup()

		-- Document existing key chains
		require('which-key').add({
			{ '<leader>c', group = 'Code' },
			{ '<leader>s', group = 'Search' },
			{ '<leader>o', group = 'Open' },
			{ '<leader>t', group = 'Tabs' },
		})
	end,
}
