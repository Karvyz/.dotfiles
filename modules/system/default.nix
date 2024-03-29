{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gnome.nix
    ./xserver.nix
    ./hyprland.nix
    ./zsh.nix
    ./virtualization.nix
    ./essentials.nix
    ./desktop.nix
  ];
}
