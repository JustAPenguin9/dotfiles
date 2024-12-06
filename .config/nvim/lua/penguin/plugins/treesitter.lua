-- Highlight, edit, and navigate code

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	lazy = false,
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'vimdoc',
				'vim',
				'lua',
				'markdown',
				'bash',
				'fish',
				'c',
				'html',
				'javascript',
				'typescript',
				'css',
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
