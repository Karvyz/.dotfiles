{ config, pkgs, ... }:

{
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #
  #   settings = {
  #     imports = [
  #       ./inputs.nix
  #       ./decoration.nix
  #     ];
  #     
  #
  #     exec-once = [ "waybar" ];
  #   };
  # };

  home.file.hyprland = {
    enable = false;
    source = ./hypr;
    target = ".config/hypr";
  };



  # waybar = {
  #   enable = false;
  #   source = ./waybar;
  #   target = ".config/waybar";
  # };
}
