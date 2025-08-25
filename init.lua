require("core.options")
require("core.keymaps")
require("config.lazy")

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "none", bg = "none" })

vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot-2025-04-03" }
