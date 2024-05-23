{ pkgs, ... } :

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		# Neovim
		neovim
		unzip
		wl-clipboard
		ripgrep
		nixd
		
		# C compiler
		gcc
		clang

		# Command-line utilities
		wget
		git
	 
		# Browser
		firefox
	];
}
