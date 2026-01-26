{ lib, config, ... }:
{
  options.dunst.enable = lib.mkEnableOption "Enable dunst home module";
  config.services.dunst = {
    enable = config.dunst.enable;
    settings.global = {
      corner_radius = config.stylix.borders.radius;
      frame_width = config.stylix.borders.width;
      offset = "(10,10)";
    };
  };
}
