{ pkgs, ... }:
{
  imports = [
    ./nvidia.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_12;
}
