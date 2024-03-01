{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Console.desktop"
      ];
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "gsconnect@andyholmes.github.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/background" = {
      picture-uri="file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jpg";
      picture-uri-dark="file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jpg";
    };
  };
}
