{ config, ... }:
{
  services.dunst = {
    enable = true;
    settings.global = {
      corner_radius = config.stylix.borders.radius;
      frame_width = config.stylix.borders.width;
      offset = "(10,10)";
    };
  };
}
