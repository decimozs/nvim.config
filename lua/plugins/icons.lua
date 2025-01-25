return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local icons = require("nvim-web-devicons")

		icons.setup({
			strict = true,
			override_by_extension = {
				astro = {
					icon = "",
					color = "#EF8547",
					name = "astro",
				},
			},
		})
	end,
}
