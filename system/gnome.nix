
{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
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
    gtile
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ch";
    variant = "fr";
  };
}
