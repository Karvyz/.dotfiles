{ config, pkgs, inputs, ... }:

{
  networking.hostName = "polaris"; # VM

  imports = [ ./../modules ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # Desktop
  gnome.enable = true;
}
