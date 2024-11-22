local opt = vim.opt

-- shared data file
-- stolen from tjdevries
opt.shada = { "'10", '<0', 's10', 'h' }

-- confirm on unsaved changes
opt.confirm = true

-- enable mouse
opt.mouse = 'a'

-- synced clipboard
opt.clipboard = 'unnamedplus'

-- line numbers
opt.number = true
opt.relativenumber = true

-- searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- lag bad
opt.updatetime = 100
opt.timeoutlen = 300

-- window splits
opt.splitright = true
opt.splitbelow = true

-- keep signcolumn always on
opt.signcolumn = 'yes'

-- minumum lines below and above the cursor
opt.scrolloff = 8

-- white space
opt.list = true
opt.listchars = {
	lead = '•',
	tab = '→ ',
	trail = '•',
	multispace = '•',
	nbsp = '↩', -- ↲ ↵
	-- eol = '⌧',
}

-- tabs
opt.smartindent = true
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.cursorline = true

opt.colorcolumn = '80,100'

opt.breakindent = true

opt.completeopt = 'menuone,noselect'

opt.undofile = true

-- format options
-- vim.formatoptions:remove('o')

