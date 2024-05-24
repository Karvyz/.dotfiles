{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "ch+fr" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };


    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      minimize = [ "<Super>i" ];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      home = [ "<Super>e" ];
      screensaver = [ "<Super>eacute" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "kgx";
      name = "Console";
    };

    "org/gnome/shell" = {
      enabled-extensions = [ "blur-my-shell@aunetx" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.com" "forge@jmmaranan.com" "gsconnect@andyholmes.github.io" "appindicatorsupport@rgcjonas.gmail.com" ];
      favorite-apps = [ "firefox.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" ];
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
