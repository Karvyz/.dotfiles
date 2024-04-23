-- Lualine
require("lualine").setup({
	icons_enabled = true,
})

-- Colorscheme
vim.cmd("colorscheme gruvbox")

-- Comment
require("Comment").setup()

-- Oil
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Autoclose
require("autoclose").setup()

-- Gitsigns
require("gitsigns").setup()

-- Neogit
require("neogit").setup {}
vim.keymap.set("n", "<leader>g", "<CMD>Neogit<CR>", { desc = "Open Neogit" })
