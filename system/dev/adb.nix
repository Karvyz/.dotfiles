{
  lib,
  pkgs,
  config,
  ...
}:
{
  options = {
    adb.enable = lib.mkEnableOption "Enable adb module";
  };

  config = lib.mkIf config.adb.enable {
    users.users.karviz.extraGroups = [ "adbusers" ];
    environment.systemPackages = [
      pkgs.androidenv.androidPkgs.platform-tools
      pkgs.android-tools
    ];
  };
}
