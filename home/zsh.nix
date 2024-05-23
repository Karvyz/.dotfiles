{ pkgs, ... }:

{  
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -al";

			ns = "nix-shell --command zsh";
			nld = "LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH zsh";
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
    fzf
    tldr
    nh
  ];

  home.sessionVariables = {
    FLAKE = "/home/karviz/.dotfiles";
  };
}
