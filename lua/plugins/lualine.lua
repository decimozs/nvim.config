local modes = {
	["n"] = "N",
	["no"] = "N",
	["v"] = "V",
	["V"] = "V",
	[""] = "V",
	["s"] = "S",
	["S"] = "S",
	[""] = "S",
	["i"] = "I",
	["ic"] = "I",
	["R"] = "R",
	["Rv"] = "R",
	["c"] = "C",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "P",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "T",
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local transparent = require("transparent").clear_prefix("lualine")
			lualine.setup({
				options = {
					icons_enabled = true,
					theme = "github_dark_dimmed",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						"NvimTree",
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = {
						{
							mode,
							color = {
								fg = "#4984CD",
							},
						},
					},
					lualine_b = {
						{
							"branch",
							color = {
								fg = "#768390",
							},
						},
					},
					lualine_x = {
						{
							"diff",
							"diagnostics",
							color = {
								fg = "#768390",
							},
						},
					},
					lualine_c = {},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				inactive_winbar = {},
				extensions = {
					"oil",
					"mason",
					"fzf",
				},
			})
		end,
	},
}
