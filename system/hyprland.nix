{ lib, config, pkgs, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    # xserver.enable = true;
    # services.xserver.displayManager.sddm.wayland.enable = true;
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      hyprlock
      pyprland
      pavucontrol
      brightnessctl
      networkmanagerapplet

      kitty 
      dunst
      waybar
      rofi-wayland

      nautilus
    ];
  };
}
