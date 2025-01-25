return {
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			local presence = require("neocord")
			presence.setup({
				global_timer = true,
			})
		end,
	},
}
