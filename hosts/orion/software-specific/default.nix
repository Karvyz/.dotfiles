{ inputs, ... }:
{
  networking.wg-quick.interfaces.wg0.configFile =
    "/home/karviz/Documents/config_wireguard_wiretest.conf";

  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    users.karviz = import ./home.nix;
  };
}
