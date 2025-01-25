return {
	"SmiteshP/nvim-navic",
	requires = "neovim/nvim-lspconfig",
	config = function()
		local navic = require("nvim-navic")
		navic.setup({
			highlight = true,
			separator = " > ",
		})
	end,
}
