{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.themes = {
    ashes.enable = lib.mkEnableOption "Enable ashes theme";
  };

  config = lib.mkIf config.themes.ashes.enable {
    stylix = {
      image = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/o3/wallhaven-o31o2p.png";
        sha256 = "sha256-KMTq1cvtV2jd+hOCBxkMWN1nZDllH9aWotqO3i0tcaw=";
      };

      base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";

      opacity.terminal = 0.85;
    };
  };
}
