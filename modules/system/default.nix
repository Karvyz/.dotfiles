{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gnome.nix
    ./xserver.nix
    ./hyprland.nix
    ./shell.nix
  ];
}
