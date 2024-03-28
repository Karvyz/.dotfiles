{ config, pkgs, inputs, ... }:

{
  networking.hostName = "orion"; # Work config

  imports = [ ./../modules ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Desktop
  gnome.enable = true;

  # Enables VMs
  virtualization.enable = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;
}
