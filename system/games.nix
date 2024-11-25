{ lib, config, ... }:

{
  options = {
    games.enable = lib.mkEnableOption "Games";
  };

  config = lib.mkIf config.games.enable {
    programs.steam.enable = true;
  };
}
