{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    wm.enable = true;
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      xdg-desktop-portal-hyprland
      hyprshot
      pyprland
    ];
  };
}
