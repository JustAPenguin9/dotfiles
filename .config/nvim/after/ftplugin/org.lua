vim.opt_local.spell = true
-- vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.b.org_indent_mode = true

vim.keymap.set("i", "<S-CR>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
	silent = true,
	buffer = true,
})
vim.keymap.set("n", "<S-CR>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
	silent = true,
	buffer = true,
})
vim.keymap.set(
	"n",
	"<leader>oiH",
	require("telescope").extensions.orgmode.insert_link,
	{ desc = "Insert link to org heading", buffer = true }
)
vim.keymap.set("n", "<leader>oE", function()
	vim.cmd.write()
	require("orgmode.export").pandoc({ extension = "pdf" })
end, { desc = "Write and export to pdf", buffer = true })

vim.keymap.set("n", "k", "gk", { silent = true, buffer = true })
vim.keymap.set("n", "j", "gj", { silent = true, buffer = true })
vim.keymap.set("n", "^", "g^", { silent = true, buffer = true })
vim.keymap.set("n", "$", "g$", { silent = true, buffer = true })
