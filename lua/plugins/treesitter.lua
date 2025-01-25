return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensured_installed = {
					"lua",
					"c",
					"cpp",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"json",
					"vim",
					"vimdoc",
				},
				sync_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
