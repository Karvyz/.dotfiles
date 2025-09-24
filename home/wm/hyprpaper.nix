{ lib, config, ... }:
{
  options.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper home module";

  config.services.hyprpaper.enable = config.hyprpaper.enable;
}
