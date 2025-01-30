{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_12;
}
