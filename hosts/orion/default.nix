{
  networking.hostName = "orion"; # Work config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  # Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  gnome.enable = true;
  kde.enable = true;
  hyprland.enable = true;
  niri.enable = true;
  desktop.enable = true;

  # Enables VMs
  virtualization.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ollama.enable = true;
}
