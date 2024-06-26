{ pkgs, ...}:
{
  stylix = {
		enable = true;
    image = ./wallpapers/BH.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
		polarity = "dark";
		cursor = {
			name = "Adwaita";
			package = pkgs.gnome.adwaita-icon-theme;
		};

		targets.kde.enable = false;
  };
}
