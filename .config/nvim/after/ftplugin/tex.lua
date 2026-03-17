-- bro what extension sets markdown settings and why
vim.opt_local.expandtab = false
vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true, buffer = true })
vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true, buffer = true })
vim.keymap.set({ "n", "v" }, "^", "g^", { silent = true, buffer = true })
vim.keymap.set({ "n", "v" }, "$", "g$", { silent = true, buffer = true })
