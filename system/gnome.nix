{ lib, config, pkgs, ... }:

{
  options = {
    gnome.enable = lib.mkEnableOption "Enable gnome module";
  };

  config = lib.mkIf config.gnome.enable {
    xserver.enable = true;

    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gedit # text editor
    ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      epiphany # web browser
      geary # email reader
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      yelp # Help view
      gnome-contacts
      gnome-initial-setup
    ]);

    environment.systemPackages = with pkgs.gnomeExtensions; [
      blur-my-shell
      gsconnect
      forge
      appindicator
    ];
  };
}
