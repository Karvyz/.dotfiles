{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
}
