{ pkgs, ... }:
{
  networking.hostName = "polaris"; # Gaming config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  # Desktop
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # kde.enable = true;
  gnome.enable = true;
  desktop.enable = true;

  games.enable = true;
  ollama.enable = true;

  nvidia.enable = true;
  programs.noisetorch.enable = true;
  services.openssh.enable = true;
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
  services.xserver.displayManager.autoLogin.enable = true;
services.xserver.displayManager.autoLogin.user = "karviz";
}
