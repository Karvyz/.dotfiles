{ config, pkgs, ... }:

{  
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -al";

      sys-edit = "nvim ~/.dotfiles";
      sys-update = "sudo nix flake update ~/.dotfiles";
      sys-rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      sys-clean = "sudo nix-collect-garbage --delete-older-than 15d";
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    initExtra = ''if [ "$TMUX" = "" ]; then tmux a; fi'';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

  };
}
