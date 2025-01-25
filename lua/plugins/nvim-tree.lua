return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local transparent = require("transparent").clear_prefix("nvim-tree")
		require("nvim-tree").setup({
			renderer = {
				root_folder_label = false,
			},
			view = {
				side = "right",
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
