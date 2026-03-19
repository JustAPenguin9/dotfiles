return {
	"ej-shafran/compile-mode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			default_command = "",
			bang_expansion = true,
			input_word_completion = true,
			recompile_no_fail = true,
		}

		vim.keymap.set("n", "<leader>C", vim.cmd.Recompile, { desc = "Recompile" })
		vim.keymap.set("n", "<leader>cc", vim.cmd.Compile, { desc = "Set and run the Compile command" })
		vim.keymap.set("n", "<leader>cq", vim.cmd.QuickfixErrors, { desc = "Send Compile errors to quickfix" })
		vim.keymap.set("n", "[c", vim.cmd.PrevError, { desc = "Go to the previous Compile error" })
		vim.keymap.set("n", "]c", vim.cmd.NextError, { desc = "Go to the next Compile error" })
	end,
}
