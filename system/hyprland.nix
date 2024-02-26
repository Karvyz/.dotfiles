
{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  
   environment.systemPackages = with pkgs; [
    kitty
    dunst
    waybar
    wofi
  ];
}
