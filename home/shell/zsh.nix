{ pkgs, ... }:

{  
  programs = {
		zsh = {
			enable = true;

			shellAliases = {
				ll = "ls -al";

				dv = "devenv init && vi devenv.nix && devenv shell";
				ns = "nix-shell --command zsh";
				za = "zellij attach";
				de = "distrobox enter";
			};

			syntaxHighlighting.enable = true;
			autosuggestion.enable = true;
			enableCompletion = true;
		};

		git = {
			enable = true;
			userName = "Henri Gros";
			userEmail = "henrigros1@gmail.com";
		};

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

  home = {
		packages = with pkgs; [
			fzf
			tldr
			nh
			(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
		];

		sessionVariables = {
			EDITOR = "nvim";
			FLAKE = "/home/karviz/.dotfiles";
		};
	};
}
