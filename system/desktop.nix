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

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      discord

      geary

      libreoffice
      gimp3

      protonvpn-gui
      qbittorrent

      spotify
      nextcloud-client
    ];

    programs.kdeconnect.enable = true;
  };
}
