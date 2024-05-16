-- Highlight, edit, and navigate code

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	-- branch = 'main',
	lazy = false,
	config = function()
		-- 'nvim-treesitter.configs'
		require('nvim-treesitter').setup({
			ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
