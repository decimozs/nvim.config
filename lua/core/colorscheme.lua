return {
	"datsfilipe/vesper.nvim",
	config = function()
		local vesper = require("vesper")
		vesper.setup({
			transparent = false, -- Boolean: Sets the background to transparent
			italics = {
				comments = true, -- Boolean: Italicizes comments
				keywords = false, -- Boolean: Italicizes keywords
				functions = true, -- Boolean: Italicizes functions
				strings = true, -- Boolean: Italicizes strings
				variables = false, -- Boolean: Italicizes variables
			},
			overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
			palette_overrides = {},
		})
		vim.cmd.colorscheme("vesper")
	end,
}
