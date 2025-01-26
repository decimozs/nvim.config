return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 1000,
	config = function()
		local colorscheme = require("github-theme")
		colorscheme.setup({
			options = {
				transparent = true,
			},
		})

		vim.cmd("colorscheme github_dark_dimmed")
	end,
}
