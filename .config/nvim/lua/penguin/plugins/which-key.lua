-- keybind help

return {
	'folke/which-key.nvim',
	event = 'VimEnter',
	config = function()
		require('which-key').setup()

		-- Document existing key chains
		require('which-key').add({
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>o", group = "[O]pen" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]abs" },
			{ "<leader>w", group = "[W]orkspace" },
		})
	end,
}

