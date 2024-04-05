{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gnome.nix
    ./xserver.nix
    ./hyprland.nix
    ./virtualization.nix
    ./essentials.nix
    ./desktop.nix
    ./devtools.nix
  ];
}
