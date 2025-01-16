{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    kde.enable = lib.mkEnableOption "Enable kde module";
  };

  config = lib.mkIf config.kde.enable {
    services.desktopManager.plasma6.enable = true;
    environment.systemPackages = with pkgs; [
      polonium
      kde-rounded-corners

      enchant
      kdePackages.sonnet
      hunspell
      hunspellDicts.en-us
      hunspellDicts.fr-any
    ];
  };
}
