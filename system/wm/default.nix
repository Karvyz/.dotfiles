{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./niri.nix
  ];

  options = {
    wm.enable = lib.mkEnableOption "Enable Window Manager module";
  };

  config = lib.mkIf config.wm.enable {
    environment.systemPackages = with pkgs; [
      pavucontrol
      brightnessctl
      networkmanagerapplet
      overskride
      hyprlock

      wofi
      kitty
      nautilus
    ];
  };
}
