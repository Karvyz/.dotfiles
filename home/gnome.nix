{ pkgs, lib, ... }:
{	
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "ch+fr" ]) ];
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
			disable-user-extensions = false;
      enabled-extensions = [ 
				pkgs.gnomeExtensions.blur-my-shell.extensionUuid
				pkgs.gnomeExtensions.gsconnect.extensionUuid
				pkgs.gnomeExtensions.forge.extensionUuid
				pkgs.gnomeExtensions.appindicator.extensionUuid
			];
      favorite-apps = [ "firefox.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" ];
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
