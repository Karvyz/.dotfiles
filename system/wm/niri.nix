{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    niri.enable = lib.mkEnableOption "Enable Niri module";
  };

  config = lib.mkIf config.niri.enable {
    wm.enable = true;
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
