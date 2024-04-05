{ lib, config, pkgs, ... }:

{
  options = {
    devtools.enable = lib.mkEnableOption "Enable devtools module";
  };

  config = lib.mkIf config.devtools.enable {
    environment.systemPackages = with pkgs; [
      rustup
      gnumake
    ];
  };
}
