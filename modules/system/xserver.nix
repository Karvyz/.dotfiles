{ lib, config, pkgs, ... }:

{
  options = {
    xserver.enable = lib.mkEnableOption "Enable xserver module";
  };

  config = lib.mkIf config.xserver.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.excludePackages = [ pkgs.xterm ];

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "ch";
      variant = "fr";
    };
  };
}
