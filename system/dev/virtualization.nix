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
      lazydocker

      podman-compose
    ];
    hardware.nvidia-container-toolkit.enable = config.nvidia.enable;
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
      podman = {
        enable = true;
        dockerSocket.enable = true;
        dockerCompat = true;
      };
    };
    environment.variables.DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
  };
}
