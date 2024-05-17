{ pkgs, config, ... }:
{
  home.file.".config/hypr/pyprland.toml".text = ''
		[pyprland]
		plugins = [
			"scratchpads",
			"expose",
		]

		[expose]
		include_special = false

		[scratchpads.term]
		animation = "fromTop"
		command = "kitty --class kitty-dropterm"
		class = "kitty-dropterm"
		size = "75% 60%"
		unfocus = "hide"

		[scratchpads.volume]
		animation = "fromRight"
		command = "pavucontrol"
		class = "pavucontrol"
		lazy = true
		size = "40% 90%"
		unfocus = "hide"
 	'';
}
