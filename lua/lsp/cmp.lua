return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = { documentation = { auto_show = true, auto_show_delay_ms = 0 }, ghost_text = { enabled = true } },
		signature = { enabled = true },
	},
}
