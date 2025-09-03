-- Highlight, edit, and navigate code

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
				-- additional_vim_regex_highlighting = { "org" },
			},
			indent = { enable = true },
			ensure_installed = {
				"vimdoc",
				"vim",
				"lua",
				"markdown",
				-- "org",
				"latex",
				"bash",
				"fish",
				"c",
				"html",
				"javascript",
				"typescript",
				"css",
			},
		})
	end,
}
