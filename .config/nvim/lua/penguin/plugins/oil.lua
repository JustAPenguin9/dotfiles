-- file manager

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				-- used elsewhere
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
			view_options = {
				show_hidden = true,
			},
			delete_to_trash = true,
			watch_for_changes = true,
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
