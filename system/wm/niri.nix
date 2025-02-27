{
  lib,
  config,
  ...
}:

{
  options = {
    niri.enable = lib.mkEnableOption "Enable Niri module";
  };

  config = lib.mkIf config.niri.enable {
    wm.enable = true;
    programs.niri.enable = true;
  };
}
