{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.themes = {
    rmbrs.enable = lib.mkEnableOption "Enable rmbrs theme";
  };

  config = lib.mkIf config.themes.rmbrs.enable {
    stylix = {
      image = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/k7/wallhaven-k7xzgm.jpg";
        sha256 = "sha256-X2l9zsWHKpJz8E0nMW84+B0nnZNmzKA54cvQz5BmWS8=";
      };

      base16Scheme = {
        base00 = "181616";
        base01 = "0d0c0c";
        base02 = "2d4f67";
        base03 = "a6a69c";
        base04 = "7fb4ca";
        base05 = "c5c9c5";
        base06 = "938aa9";
        base07 = "c5c9c5";
        base08 = "c4746e";
        base09 = "e46876";
        base0A = "c4b28a";
        base0B = "8a9a7b";
        base0C = "8ea4a2";
        base0D = "8ba4b0";
        base0E = "a292a3";
        base0F = "7aa89f";
      };

      opacity.terminal = 0.85;
    };
  };

}
