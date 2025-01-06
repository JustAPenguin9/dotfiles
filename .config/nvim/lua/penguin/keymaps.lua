-- easier lua stuff
vim.keymap.set("n", "<leader>X", "<cmd>source % | echo 'sourced the file'<CR>", { desc = "Source the current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source the current line of lua code" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source the selected lua code" })

-- clipboard (unneeded if clipboard is unnamedplus in options.lua)
-- hidden by which-key
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>d", '"+d', { desc = "Cut to clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy line to clipboard" })
vim.keymap.set("n", "<leader>dd", '"+dd', { desc = "Cut line to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("v", "<leader>d", '"+d', { desc = "Cut to clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- exit terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- window nav
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- quickfix: ctrl-q, cnext, cprev, cdo
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Go to previous in the Quickfix list" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Go to next in the Quickfix list" })

-- diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- tabs
vim.keymap.set("n", "<leader>tb", "<C-w>T", { desc = "Break out current buffer to new tab" })
vim.keymap.set("n", "<leader>tB", "<C-w>TgT", { desc = "Break out current buffer to new tab without changing focus" })
vim.keymap.set("n", "<leader>ts", "<cmd>tab split<CR>", { desc = "Split the current buffer to a new tab" })
vim.keymap.set(
	"n",
	"<leader>tS",
	"<cmd>tab split<CR>gT",
	{ desc = "Split the current buffer to a new tab without changing focus" }
)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabNext, { desc = "Next tab (gt)" })
vim.keymap.set("n", "<leader>tp", vim.cmd.tabPrevious, { desc = "Previous tab (gT)" })

-- if hlsearch is true enable this
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- insert
-- TODO: dates
vim.keymap.set("n", "<leader>id", "<cmd>pu=strftime('%F')<CR>")
vim.keymap.set("n", "<leader>it", "<cmd>pu=strftime('%T')<CR>") -- TODO: needs new name it is TODO
-- TODO: fix this (maybe make it a snippet)
vim.keymap.set("n", "<leader>it", "aTODO: ", { desc = "Insert todo comment" })
vim.keymap.set("n", "<leader>if", "aFIX: ", { desc = "Insert fix comment" })
vim.keymap.set("n", "<leader>in", "aNOTE: ", { desc = "Insert note comment" })
