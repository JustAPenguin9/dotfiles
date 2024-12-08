-- fuzzy finder

return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ -- If encountering errors, see telescope-fzf-native README for install instructions
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
	},
	config = function()
		require('telescope').setup({
			-- pickers = {
			-- 	find_files = {
			-- 		hidden = true,
			-- 	},
			-- },
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		})

		-- Enable telescope extensions, if they are installed
		pcall(require('telescope').load_extension, 'rg') -- fzf
		pcall(require('telescope').load_extension, 'ui-select')

		-- See `:help telescope.builtin`
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader><leader>', function()
			local cmd = vim.api.nvim_exec2('!git rev-parse --is-inside-work-tree', { output = true })
			local out = string.sub(cmd.output, 41, 44) -- bruh
			if out == 'true' then
				require('telescope.builtin').git_files()
			else
				require('telescope.builtin').find_files()
			end
		end, { desc = 'Search (tracked) files' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search files' })
		vim.keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = 'Search recent files' })
		vim.keymap.set('n', '<leader>sp', builtin.git_files, { desc = 'Search git repo files' })
		vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search buffers' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search via grep' })
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search current buffer' })

		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help docs' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })

		vim.keymap.set('n', '<leader>s.', builtin.resume, { desc = 'Resume last search' })
		vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Telescope builtins' })

		-- Shortcut for searching your neovim configuration files
		vim.keymap.set('n', '<leader>sn', function()
			builtin.find_files({ cwd = vim.fn.stdpath('config') })
		end, { desc = 'Search Neovim config' })
	end,
}
