{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.nvidia.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true; # Set to false for proprietary drivers
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    nix.settings = {
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    environment.systemPackages = with pkgs; [
      cudaPackages.cudatoolkit
    ];
  };
}
