return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			ui = {
				code_action = "",
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
