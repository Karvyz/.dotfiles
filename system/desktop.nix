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
      vesktop

      geary

      libreoffice
      gimp3

      protonvpn-gui
      qbittorrent

      spotify
      nextcloud-client

      jan
    ];

    programs.kdeconnect.enable = true;
  };
}
