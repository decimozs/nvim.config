return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			symbol_in_winbar = {
				enable = false,
			},
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
