{ config, pkgs, ... }:

{
	imports = [
		./hyprland.nix
	];

  home.file.hyprland = {
    enable = true;
    source = ./hypr;
    target = ".config/hypr";
  };
}
