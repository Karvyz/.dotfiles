{
  networking.hostName = "orion"; # Work config

  imports = [ ./hardware-configuration.nix ];

  # Desktop
  gnome.enable = true;
  kde.enable = true;
  hyprland.enable = true;
  desktop.enable = true;

  # Enables VMs
  virtualization.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ollama.enable = true;
}
