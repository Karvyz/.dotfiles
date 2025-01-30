{ inputs, ... }:
{
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    users.karviz = import ./home.nix;
  };
}
