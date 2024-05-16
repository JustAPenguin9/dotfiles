-- colour schemes

return {
	{
		'ellisonleao/gruvbox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = 'dark'
			require('gruvbox').setup({
				transparent_mode = true,
			})

			vim.cmd.colorscheme('gruvbox')
		end,
	},
}

