{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    games.enable = lib.mkEnableOption "Games";
  };

  config = lib.mkIf config.games.enable {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [ heroic ];
  };
}
