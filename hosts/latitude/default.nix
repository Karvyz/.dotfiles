{
  networking.hostName = "latitude"; # Work config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  # Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  kde.enable = true;
  desktop.enable = true;

  # Enables VMs
  virtualization.enable = true;

  ollama.enable = true;
}
