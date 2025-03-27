{ inputs, ... }:
{
  networking = {
    interfaces."enp34s0".wakeOnLan.enable = true;
    firewall.allowedTCPPorts = [
      8188
    ];
  };
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    users.karviz = import ./home.nix;
  };
}
