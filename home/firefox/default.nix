{ lib, pkgs, ... }:
{
  imports = [ ./policies.nix ];

  programs.firefox = {
    enable = true;
    profiles.karviz = {
      name = "karviz";
      isDefault = true;
      extensions.force = true;
    };
  };

  home.sessionVariables.BROWSER = lib.makeBinPath [ pkgs.firefox ];
  stylix.targets.firefox = {
    profileNames = [ "karviz" ];
    colorTheme.enable = true;
  };
}
