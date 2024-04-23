{ config, pkgs, ... }:

{
  imports = [
    ./cmp.nix
  ];
  programs.nixvim = {
    enable = true;


    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.vscode.enable = true;

    plugins = {
      lualine.enable = true;
      lsp = {
	enable = true;
	servers = {
	  lua-ls.enable = true;
	  rust-analyzer = {
	    enable = true;
	    installCargo = false;
	    installRustc = false;
	  };
	};
      };
    };
  };
}
