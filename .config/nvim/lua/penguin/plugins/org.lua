-- .org files

return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	dependencies = {
		"nvim-orgmode/org-bullets.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-orgmode/telescope-orgmode.nvim",
	},
	ft = { "org" },
	config = function()
		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/Documents/org/**/*",
			org_default_notes_file = "~/Documents/org/refile.org",
		})

		-- i only want the heading bullets
		require("org-bullets").setup({
			symbols = {
				checkboxes = false,
				list = false,
				-- checkboxes = {
				-- 	todo = { " " }, -- maybe "_" instead
				-- 	half = { "-" },
				-- 	done = { "x" },
				-- },
				-- list = "-",
			},
		})

		-- telescope integration
		require("telescope").load_extension("orgmode")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "org",
			callback = function()
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
					{ desc = "Insert link to org heading" }
				)
			end,
		})

		local teleorg = require("telescope").extensions.orgmode
		vim.keymap.set("n", "<leader>oR", teleorg.refile_heading, { desc = "Refile org heading" })
		vim.keymap.set("n", "<leader>so", teleorg.search_headings, { desc = "Search org headins" })
		vim.keymap.set("n", "<leader>sO", function()
			require("telescope").extensions.orgmode.search_headings({ mode = "orgfiles" })
		end, { desc = "Search org files" })
	end,
}
