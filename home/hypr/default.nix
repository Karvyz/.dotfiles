{ lib, ... }:
{
  options.hyprland.enable = lib.mkEnableOption "Enable Hyprland home module";

  imports = [
    ./hyprland.nix
    ./binds.nix
    ./pyprland.nix
  ];
}
