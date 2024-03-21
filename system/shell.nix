{ config, pkgs, ... }:

{
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
}
