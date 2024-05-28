{ pkgs, ...}:
{
  stylix = {
    image = ./wallpapers/BH.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
		polarity = "dark";
  };
}
