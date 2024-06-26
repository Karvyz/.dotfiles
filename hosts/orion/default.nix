{
  networking.hostName = "orion"; # Work config

  imports = [ ./hardware-configuration.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	# Hardware
	nvidia.enable = false;

  # Desktop
  gnome.enable = true;
  hyprland.enable = true;
  desktop.enable = true;
	ollama.enable = false;

	# Dev
	devenvs.enable = true;

  # Enables VMs
  virtualization.enable = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;
}
