{ lib, config, pkgs, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "Enable Zsh module";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      neovim
      unzip
      wl-clipboard
      ripgrep

      wget
      git
      gcc

      btop
      tmux
      fzf
      atuin
      tldr
    ];
  };
}
