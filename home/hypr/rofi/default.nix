{ pkgs, config, ...}:
let
	palette = config.lib.stylix.colors;
in {
	home = {
		packages = [
			pkgs.rofi-wayland
		];
		file = {
			".config/rofi/config.rasi".source = config.lib.file.mkOutOfStoreSymlink /home/karviz/.dotfiles/home/rofi/config.rasi;
			".config/rofi/theme.rasi".text = ''
* {
		bg0: #${palette.base00};
		bg1: #${palette.base01};
		bg2: #${palette.base02};
		bg3: #${palette.base03};
		fg0: #${palette.base04};
		fg1: #${palette.base05};
		fg2: #${palette.base06};
		fg3: #${palette.base07};
		borders: #${palette.base0B}; 
}
		'';
		};
	};
}
