{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.nvidia.enable = lib.mkEnableOption "Enable nvidia module";
  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      graphics.enable = true;

      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        open = true;

      };
    };

    # CUDA
    nixpkgs.config = {
      allowUnfree = true;
      cudaSupport = true;
    };
    environment.variables = {
      CUDA_PATH = pkgs.cudatoolkit;
      CUDA_LIBRARY_PATH = lib.makeLibraryPath [
        pkgs.linuxPackages.nvidia_x11
      ];
    };
    nix.settings = {
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
