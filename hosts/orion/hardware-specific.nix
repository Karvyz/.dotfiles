{ pkgs, ... }:
{
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # NVIDIA
  nvidia.enable = false;
  hardware.nvidia.prime = {
    offload.enable = true;
    amdgpuBusId = "PCI:8:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
