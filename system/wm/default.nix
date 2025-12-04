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

  options.wm.enable = lib.mkEnableOption "Enable Window Manager module";

  config = lib.mkIf config.wm.enable {
    gdm.enable = true;
    programs.xwayland.enable = true;
    environment.systemPackages = with pkgs; [
      pavucontrol
      brightnessctl
      networkmanagerapplet
      hyprlock

      wofi
      kitty
      nautilus
    ];
  };
}
