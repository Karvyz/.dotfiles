{ config, pkgs, ... }:
{
  networking.hostName = "polaris"; # Gaming config

  imports = [ ./hardware-configuration.nix ];

  # Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  kde.enable = true;
  desktop.enable = true;

  games.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; # Set to false for proprietary drivers
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  ollama.enable = true;

  # environment.systemPackages = with pkgs; [ noisetorch ];
  programs.noisetorch.enable = true;
  services.openssh.enable = true;
}
