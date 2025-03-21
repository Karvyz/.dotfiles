{ lib, config, ... }:
{
  config = lib.mkIf config.nvidia.enable {
    # Load "nvidia" driver for Xorg and Wayland
    # Or if you have an older card, you may have to use
    # one of the legacy drivers:
    # "nvidiaLegacy390", "nvidiaLegacy340", "nvidiaLegacy304"
    # Source: https://nixos.org/manual/nixos/stable/#sec-x11-graphics-cards-nvidia
    services.xserver.videoDrivers = [ "nvidia" ];

    # Enable graphics driver in NixOS unstable/NixOS 24.11
    hardware = {
      graphics.enable = true;

      nvidia = {
        # Modesetting is required.
        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
        # of just the bare essentials.
        powerManagement.enable = false;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = true;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of
        # supported GPUs is at:
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        # Only available from driver 515.43.04+
        # Currently alpha-quality/buggy, so false is currently the recommended setting.
        open = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          # Make sure to use the correct Bus ID values for your system!
          amdgpuBusId = "PCI:8:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
  };
}
