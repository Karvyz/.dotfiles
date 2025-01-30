{
  networking.hostName = "ruin"; # Homelab config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  # Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  kde.enable = true;

  services.openssh.enable = true;
}
