{ lib, config, pkgs, ... }:

{
  options = {
    plasma.enable = lib.mkEnableOption "Enable KDE Plasma module";
  };

  config = lib.mkIf config.plasma.enable {
    xserver.enable = true;

    services.xserver.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;

  };
}
