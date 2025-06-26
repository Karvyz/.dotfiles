{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    gnome.enable = lib.mkEnableOption "Enable gnome module";
  };

  config = lib.mkIf config.gnome.enable {
    services.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = (
      with pkgs;
      [
        gnome-photos
        gnome-tour
        gedit # text editor
        yelp # Help view
        cheese # webcam tool
        epiphany # web browser
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-contacts
        gnome-initial-setup
        seahorse
      ]
    );

    environment.systemPackages = with pkgs.gnomeExtensions; [
      blur-my-shell
      gsconnect
      forge
      appindicator
      paperwm
    ];
  };
}
