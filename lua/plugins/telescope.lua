return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	config = function()
		local telescope = require("telescope")
		local transparent = require("transparent").clear_prefix("telescope")
		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "    ",
				entry_prefix = "   ",
				path_display = { "truncate" },
				vimgrep_arguments = {
					"rg",
					"--follow", -- Follow symbolic links
					"--hidden", -- Search for hidden files
					"--no-heading", -- Don't group matches by each file
					"--with-filename", -- Print the file path with the matched lines
					"--line-number", -- Show line numbers
					"--column", -- Show column numbers
					"--smart-case", -- Smart case search
					"--glob=!**/.git/*",
					"--glob=!**/.idea/*",
					"--glob=!**/.vscode/*",
					"--glob=!**/build/*",
					"--glob=!**/dist/*",
					"--glob=!**/yarn.lock",
					"--glob=!**/package-lock.json",
					"--ignore-file",
					".gitignore",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob=!**/.git/*",
						"--glob=!**/.idea/*",
						"--glob=!**/.vscode/*",
						"--glob=!**/build/*",
						"--glob=!**/dist/*",
						"--glob=!**/yarn.lock",
						"--glob=!**/package-lock.json",
					},
				},
			},
		})
	end,
}
