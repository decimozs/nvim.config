vim.g.mapleader = " "

local keymap = vim.keymap

-- Nvim tree files
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- insert mode
-- save
keymap.set("i", "<c-s>", "<cmd>w<cr><esc>'", { noremap = true })

-- visual mode
-- select all
keymap.set("n", "<C-a>", "ggVG", { noremap = true })

-- go to the top
keymap.set("n", "<C-t>", "gg0", { noremap = true, silent = true })

-- go to the bottom
keymap.set("n", "<C-b>", "G$", { noremap = true, silent = true })

-- go to the end of the line
keymap.set("n", "ee", "$", { noremap = true, silent = true })

-- flash
keymap.set("n", "s", '<cmd>lua require("flash").jump()<cr>')
keymap.set("n", "<leader>lt", '<cmd>lua require("flash").treesitter()<cr>')
keymap.set("n", "<leader>lr", '<cmd>lua require("flash").remote()<cr>')
keymap.set("n", "<leader>lx", '<cmd>lua require("flash").treesitter_search()<cr>')

-- vim maximizer
keymap.set("n", "<leader>o", "<cmd>MaximizerToggle<cr>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<C-Up>", "<cmd>resize +10<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -10<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- navigating window
keymap.set("n", "<leader>ww", "<C-W>l", { desc = "move to the window on the right" })
keymap.set("n", "<leader>qq", "<C-W>h", { desc = "move to the window on the left" })
keymap.set("n", "<leader>kk", "<C-W>k", { desc = "move to the window on the top" })
keymap.set("n", "<leader>jj", "<C-W>j", { desc = "move to the window on the below" })

-- lsp saga
keymap.set("n", "K", "<cmd>Lspsaga hover_doc")

-- mason
keymap.set("n", "<leader>mason", "<cmd>Mason<cr>")

-- lazy
keymap.set("n", "<leader>lazy", "<cmd>Lazy<cr>")

-- terminal
keymap.set("n", "<c-T>", "<cmd>Lspsaga term_toggle<cr>")
