{
	programs.nixvim = {
		globals = {
			mapleader = " ";
			maplocalleader = " ";
		};

		plugins.lsp.keymaps.lspBuf = {
			"gd" = "definition";
			"gD" = "references";
			"gt" = "type_definition";
			"gi" = "implementation";
			"K" = "hover";
		};	

		keymaps = [
			{
				mode = "n";
				key = "-";
				action = "<cmd>Oil<CR>";
			}

			{
				mode = "n";
				key = "<leader>ff";
				action = "<cmd>Telescope find_files<CR>";
			}
			{
				mode = "n";
				key = "<leader>fg";
				action = "<cmd>Telescope live_grep<CR>";
			}

			{
				mode = "n";
				key = "<leader>g";
				action = "<cmd>Neogit<CR>";
			}
		];
	};
}
