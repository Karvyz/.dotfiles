
{ lib, config, pkgs, ... } :

{
  options = {
    desktop.enable = lib.mkEnableOption "desktop packages";
  };

  config = lib.mkIf config.desktop.enable {
    environment.systemPackages = with pkgs; [
      discord

      protonvpn-gui
      qbittorrent
    ];
  };
}
