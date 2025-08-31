{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.themes = {
    ira.enable = lib.mkEnableOption "Enable ira theme";
  };

  config = lib.mkIf config.themes.ira.enable {
    stylix = {
      image = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/3l/wallhaven-3lx9x6.jpg";
        sha256 = "sha256-BqgN72RGMpb8s/OOee0j0KDUFI7nSb9NGpBKZc59Fvc=";
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
    };
  };

}
