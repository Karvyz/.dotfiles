{
  networking.hostName = "orion"; # Work config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  # Desktop
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  gnome.enable = true;
  hyprland.enable = true;
  niri.enable = true;
  desktop.enable = true;

  # Enables VMs
  virtualization.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ollama.enable = true;
  adb.enable = true;
}
