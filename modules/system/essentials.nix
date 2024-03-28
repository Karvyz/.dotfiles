{ lib, config, pkgs, ... } :

{
  options = {
    essentials.enable = lib.mkOption {
      default = true;
      example = true;
      description = "Whether to enable essentials packages.";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.essentials.enable {
    environment.systemPackages = with pkgs; [
      # Neovim
      neovim
      unzip
      wl-clipboard
      ripgrep
      nixd
      
      # C compiler
      gcc

      # Command-line utilities
      wget
      git
      btop
      tmux
      fzf
      atuin
      tldr

      # Browser
      firefox
    ];
  };
}
