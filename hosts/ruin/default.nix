{
  networking.hostName = "ruin"; # Homelab config

  imports = [
    ./hardware-specific
    ./software-specific
  ];

  services.openssh.enable = true;
}
