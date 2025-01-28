{ pkgs, ... }:
{
  imports = [
    ./nvidia.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
