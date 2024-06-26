-- Lualine
require("lualine").setup({
	icons_enabled = true,
})

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

-- Noice
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	presets = {
		bottom_search = true,       -- use a classic bottom cmdline for search
		command_palette = true,     -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,         -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false,     -- add a border to hover docs and signature help
	},
})
