{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gnome.nix
    ./plasma.nix
    ./xserver.nix
    ./hyprland.nix
    ./virtualization.nix
    ./essentials.nix
    ./desktop.nix
    ./devtools.nix
  ];
}
