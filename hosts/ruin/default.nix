{
  networking.hostName = "ruin"; # Homelab config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  nextcloud.enable = true;
  services.openssh.enable = true;
}
