{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [ inputs.niri.nixosModules.niri ];

  options.niri.enable = lib.mkEnableOption "Enable Niri system module";

  config = lib.mkIf config.niri.enable {
    home-manager.users.karviz.niri.enable = true;
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
