{ pkgs, ... }:

{  
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -al";

			dv = "devenv init && vi devenv.nix && devenv shell";
			ns = "nix-shell --command zsh";
			nld = "LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH zsh";
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };

	programs = {
		starship.enable = true;
		atuin.enable = true;
		direnv = {
			enable = true;
			nix-direnv.enable = true;
		};
		btop = {
			enable = true;
			settings.update_ms = 500;
		};
	};

  home.packages = with pkgs; [
		devenv
    fzf
    tldr
    nh
  ];

  home.sessionVariables = {
    FLAKE = "/home/karviz/.dotfiles";
  };
}
