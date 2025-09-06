{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    niri.enable = lib.mkEnableOption "Enable Niri module";
  };

  imports = [ inputs.niri.nixosModules.niri ];

  config = lib.mkIf config.niri.enable {
    wm.enable = true;
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
