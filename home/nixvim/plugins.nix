{
	programs.nixvim.plugins = {
		treesitter.enable = true;
		lualine.enable = true;
		oil.enable = true;

		comment.enable = true;
		autoclose.enable = true;

		web-devicons.enable = true;
		telescope = {
			enable = true;
			extensions = {
				fzf-native = {
					enable = true;
				};
			};
		};

		neogit.enable = true;
		gitsigns.enable = true;

		noice.enable = true;
	};
}
