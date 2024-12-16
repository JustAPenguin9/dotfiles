-- shared data file
-- stolen from tjdevries
vim.opt.shada = { "'10", "<0", "s10", "h" }

-- confirm on unsaved changes
vim.opt.confirm = true

-- enable mouse
vim.opt.mouse = "a"

-- synced clipboard
-- vim.opt.clipboard = 'unnamedplus'

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- lag bad
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- keep signcolumn always on
vim.opt.signcolumn = "yes"

-- minumum lines below and above the cursor
vim.opt.scrolloff = 8

-- white space
vim.opt.list = true
vim.opt.listchars = {
	lead = "•",
	tab = "→ ",
	trail = "•",
	multispace = "•",
	nbsp = "↩", -- ↲ ↵
	-- eol = '⌧',
}

-- tabs
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.cursorline = true

vim.opt.colorcolumn = "80,100"

vim.opt.breakindent = true

vim.opt.completeopt = "menuone,noselect"

vim.opt.undofile = true

-- format options
vim.opt.formatoptions:remove({ "o", "r" })
