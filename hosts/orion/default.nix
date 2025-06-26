{
  networking.hostName = "orion"; # Work config

  imports = [
    ./hardware-configuration.nix
    ./hardware-specific.nix
    ./software-specific
  ];

  # Desktop
  services.displayManager.gdm.enable = true;
  gnome.enable = true;
  # hyprland.enable = true;
  niri.enable = true;
  desktop.enable = true;

  # Enables VMs
  virtualization.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ollama.enable = true;
  adb.enable = true;

  games.enable = true;
}
