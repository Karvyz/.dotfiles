{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    virtualization.enable = lib.mkEnableOption "Enable virtualization module";
  };

  config = lib.mkIf config.virtualization.enable {
    environment.systemPackages = with pkgs; [
      virtiofsd
      gnome-boxes

      distrobox
    ];
    hardware.nvidia-container-toolkit.enable = config.nvidia.enable;
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
      docker.enable = true;
    };
  };
}
