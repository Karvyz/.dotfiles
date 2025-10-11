{ lib, config, ... }:
{
  options.flatpak.enable = lib.mkEnableOption "Flatpak";

  config = lib.mkIf config.flatpak.enable {
    services.flatpak.enable = true;
  };
}
