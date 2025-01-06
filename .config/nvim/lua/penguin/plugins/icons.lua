-- icons used by oil and telescope

return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override_by_extension = {
				["org_archive"] = {
					icon = "",
					color = "#77AA99",
					cterm_color = "73",
					name = "OrgModeArchive",
				},
				["env"] = {
					icon = "󱕵",
					color = "#ffc400",
					cterm_color = "227",
					name = "Env",
				},
			},
			override_by_filename = {
				["todo.md"] = {
					icon = "",
					color = "#37bf3c",
					cterm_color = "253",
					name = "Todo",
				},
				["license"] = {
					icon = "",
					color = "#4d3520", -- this colour wont change
					cterm_color = "185",
					name = "License",
				},
				[".env"] = {
					icon = "󱕵",
					color = "#ffc400",
					cterm_color = "227",
					name = "Env",
				},
			},
		})
	end,
}
