-- comment lines and blocks

return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		-- these do not work and i don't know why
		vim.keymap.set("n", "<C-/>", "gcc", { desc = "Comment line (gcc)" })
		vim.keymap.set("v", "<C-/>", "gc", { desc = "Comment line (gcc)" })
	end,
}
