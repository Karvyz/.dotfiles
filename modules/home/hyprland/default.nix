{ config, pkgs, ... }:

{
	imports = [
		./hyprland.nix
		./hyprlock.nix
		./pyprland.nix
	];
}
