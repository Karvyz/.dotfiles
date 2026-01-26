{ lib, config, ... }:
{
  imports = [
    ./anyrun.nix
    ./dunst.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./noctalia.nix
    ./rofi.nix
    ./waybar.nix
    ./wpaperd.nix
  ];

  options.custom-shell.enable = lib.mkEnableOption "Enable custom shell home module";
  config = lib.mkIf config.custom-shell.enable {
    anyrun.enable = true;
    dunst.enable = true;
    waybar.enable = true;
    wpaperd.enable = true;
  };
}
