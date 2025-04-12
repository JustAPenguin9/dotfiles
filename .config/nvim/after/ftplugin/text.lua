vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.keymap.set("n", "k", "gk", { silent = true, buffer = true })
vim.keymap.set("n", "j", "gj", { silent = true, buffer = true })
vim.keymap.set("n", "^", "g^", { silent = true, buffer = true })
vim.keymap.set("n", "$", "g$", { silent = true, buffer = true })
