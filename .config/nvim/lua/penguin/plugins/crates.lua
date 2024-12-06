-- rust dependencies helper

return {
	'saecki/crates.nvim',
	tag = 'stable',
	event = { 'BufRead Cargo.toml' },
	config = function()
		local crates = require('crates')
		crates.setup()

		vim.keymap.set('v', '<leader>cr', crates.reload, { desc = 'Reload crates' })
		vim.keymap.set('n', '<leader>cu', crates.upgrade_crate, { desc = 'Update crate' })
		vim.keymap.set('v', '<leader>cu', crates.upgrade_crates, { desc = 'Update crates' })

		vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, { desc = 'Show versions' })
		vim.keymap.set('n', '<leader>cf', crates.show_features_popup, { desc = 'Show features' })
		vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, { desc = 'Show dependencies' })

		vim.keymap.set(
			'n',
			'<leader>cb',
			crates.expand_plain_crate_to_inline_table,
			{ desc = 'Surround version with braces' }
		)
		vim.keymap.set('n', '<leader>cX', crates.extract_crate_into_table, { desc = 'Extract crate to a table' })

		vim.keymap.set('n', '<leader>cH', crates.open_homepage, { desc = 'Open crate homepage' })
		vim.keymap.set('n', '<leader>cD', crates.open_documentation, { desc = 'Open crate documentation' })
		vim.keymap.set('n', '<leader>cR', crates.open_repository, { desc = 'Open crate respository' })
		vim.keymap.set('n', '<leader>cC', crates.open_crates_io, { desc = 'Open crate crates.io page' })
	end,
}
