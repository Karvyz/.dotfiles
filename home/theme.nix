{ pkgs, ...}:
{
  stylix = {
		enable = true;
    image = ./wallpapers/BH.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
		polarity = "dark";
		opacity.terminal = 0.85;
		cursor = {
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
		};

		targets.kde.enable = false;
  };
}
