{
  networking.hostName = "polaris"; # Gaming config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  # Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  kde.enable = true;
  desktop.enable = true;

  games.enable = true;
  ollama.enable = true;

  nvidia.enable = true;
  programs.noisetorch.enable = true;
  services.openssh.enable = true;
}
