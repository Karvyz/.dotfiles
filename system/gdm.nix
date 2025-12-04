{ lib, config, ... }:
{
  options.gdm.enable = lib.mkEnableOption "Enable gdm module";

  config = lib.mkIf config.gnome.enable {
    services.displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
  };
}
