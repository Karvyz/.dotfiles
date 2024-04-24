{ config, pkgs, inputs, ... }:

{
  imports = [
		./nvidia.nix
    ./gnome.nix
    ./xserver.nix
    ./hyprland.nix
    ./virtualization.nix
    ./essentials.nix
    ./desktop.nix
    ./devtools.nix
  ];
}
