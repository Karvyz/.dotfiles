{ config, pkgs, ... }:

{  
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -al";
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

  };

  home.packages = with pkgs; [
    btop
    tmux
    fzf
    tldr
    nh
  ];

  home.sessionVariables = {
    FLAKE = "/home/karviz/.dotfiles";
  };
}
