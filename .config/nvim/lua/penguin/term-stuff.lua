-- terminal stuffs
-- NOTE: i still don't think this completely works
local open_term = function(termName)
	if vim.api.nvim_buf_is_loaded(termName) then
		vim.cmd.b(termName)
		return termName
	else
		vim.cmd.term()
		return vim.api.nvim_buf_get_number(0)
	end
end

local termBuffer = -1
vim.keymap.set("n", "<leader>oT", function()
	vim.cmd.tabnew()
	termBuffer = open_term(termBuffer)
end, { desc = "Open terminal in a new tab" })

vim.keymap.set("n", "<leader>ot", function()
	vim.cmd.vnew()
	vim.cmd.wincmd("L")
	termBuffer = open_term(termBuffer)
end, { desc = "Open terminal in a vertical split" })

vim.keymap.set("n", "<leader>os", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	termBuffer = open_term(termBuffer)
	vim.api.nvim_win_set_height(0, 15)
end, { desc = "Open terminal in a horizonal split" })
