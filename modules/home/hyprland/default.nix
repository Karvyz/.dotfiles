{ config, pkgs, ... }:

{
  home.file.hyprland = {
    enable = true;
    source = ./hypr;
    target = ".config/hypr";
  };
}
