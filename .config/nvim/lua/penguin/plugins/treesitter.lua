-- Highlight, edit, and navigate code

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter.install").prefer_git = true

		require("nvim-treesitter").setup({
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
				"gitcommit",
				"diff",
				"markdown",
				-- "org",
				-- "latex",
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
