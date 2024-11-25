{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    desktop.enable = lib.mkEnableOption "desktop packages";
  };

  config = lib.mkIf config.desktop.enable {
    environment.systemPackages = with pkgs; [
      discord

      libreoffice
      gimp

      protonvpn-gui
      qbittorrent
    ];
  };
}
