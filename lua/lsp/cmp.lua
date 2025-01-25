return {
	"hrsh7th/nvim-cmp",
	event = "insertenter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"l3mon4d3/luasnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			window = {
				performance = {
					debounce = 500,
					throttle = 550,
					fetching_timeout = 80,
				},
				completion = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					keyword_length = 3,
					winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder,FloatTitle:CmpDocBorderTitle,CursorLine:PmenuSel",
				},
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder,FloatTitle:CmpDocBorderTitle,CursorLine:CmpDocSelect",
				},
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<c-b>"] = cmp.mapping.scroll_docs(-4),
				["<c-f>"] = cmp.mapping.scroll_docs(4),
				["<c-space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<c-e>"] = cmp.mapping.abort(), -- close completion window
				["<enter>"] = cmp.mapping.confirm({ select = true }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				--	{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = function(entry, item)
					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
					item = require("lspkind").cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, item)
					if color_item.abbr_hl_group then
						item.kind_hl_group = color_item.abbr_hl_group
						item.kind = color_item.abbr
					end
					return item
				end,
			},
			experimental = {
				ghost_text = true,
			},
		})
	end,
}
