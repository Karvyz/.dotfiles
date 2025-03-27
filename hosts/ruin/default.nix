{ pkgs, ... }:
{
  networking.hostName = "ruin"; # Homelab config

  imports = [
    ./hardware-specific
    ./software-specific
  ];
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "karviz";
  };
  gnome.enable = true;
  nextcloud.enable = true;
  services.openssh.enable = true;
  environment.systemPackages = [ pkgs.firefox-esr ];
}
