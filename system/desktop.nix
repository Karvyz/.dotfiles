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
    flatpak.enable = true;
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      vesktop

      geary

      libreoffice
      gimp

      protonvpn-gui
      qbittorrent

      spotify
      nextcloud-client

      jan
    ];

    programs = {
      kdeconnect.enable = true;
      noisetorch.enable = true;
    };
  };
}
