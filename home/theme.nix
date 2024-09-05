{ pkgs, ...}:
{
  stylix = {
		enable = true;
    image = pkgs.fetchurl {
			url = "https://w.wallhaven.cc/full/g8/wallhaven-g83qpe.jpg";
			sha256 = "sha256-orMabHyGVacR9m/sK9Am0G1+tYopvwa/n0K20kPNI9A=";
  	};
    base16Scheme = "${pkgs.base16-schemes}/share/themes/seti.yaml";
		polarity = "dark";
		opacity.terminal = 0.85;
		cursor = {
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
		};

		targets.plymouth.enable = false;
  };
}
