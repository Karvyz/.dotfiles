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
    programs.adb.enable = true;
    environment.systemPackages = [ pkgs.androidenv.androidPkgs.platform-tools ];
  };
}
