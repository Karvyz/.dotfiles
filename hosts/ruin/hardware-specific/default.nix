{ pkgs, ... }:
{
  imports = [ ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
