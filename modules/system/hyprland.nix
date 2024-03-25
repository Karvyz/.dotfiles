{ lib, config, pkgs, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      kitty
      dunst
      # waybar
      wofi
    ];
  };
}
