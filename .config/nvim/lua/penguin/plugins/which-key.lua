-- keybind help

return {
	'folke/which-key.nvim',
	event = 'VimEnter',
	config = function()
		require('which-key').setup()

		-- Document existing key chains
		require('which-key').add({
			{ -- you don't need to hide these if you dont want to
				mode = { 'n', 'v' },
				{ '<leader>y', hidden = true },
				{ '<leader>yy', hidden = true },
				{ '<leader>d', hidden = true },
				{ '<leader>dd', hidden = true },
				{ '<leader>p', hidden = true },
				{ '<leader>P', hidden = true },
			},

			{ '<leader>c', group = 'Code / LSP' },
			{ '<leader>s', group = 'Search' },
			{ '<leader>o', group = 'Open' },
			{ '<leader>t', group = 'Tabs' },
		})
	end,
}
