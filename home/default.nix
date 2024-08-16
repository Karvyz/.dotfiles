{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "karviz";
  home.homeDirectory = "/home/karviz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
		./ags.nix
		./scripts
		./theme.nix
    ./zsh.nix
    ./hyprland
		./waybar.nix
		./rofi.nix
    ./neovim
    ./gnome.nix
    ./tmux.nix
		./kitty.nix
  ];
  
	nixpkgs.config.allowUnfree = true;
	
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
