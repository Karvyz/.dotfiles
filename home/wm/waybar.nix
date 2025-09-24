{ config, ... }:
let
  palette = config.lib.stylix.colors;
in
{
  programs.waybar = {
    enable = false;
  };
}
