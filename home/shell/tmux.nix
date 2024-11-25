{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      sessionist
      resurrect
      continuum
      gruvbox
    ];

    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      set-option -g status-position top

      set -g @continuum-restore 'on'
    '';
  };
}
