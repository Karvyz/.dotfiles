{ config, pkgs, ... }:

{
  home.file = {
    hyprland = {
      enable = true;
      source = ./hypr;
      target = ".config/hypr";
    };
    waybar = {
      enable = true;
      source = ./waybar;
      target = ".config/waybar";
    };
  };
}
