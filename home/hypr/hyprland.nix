{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = ",1920x1200@120,auto,1";
      env = "XCURSOR_SIZE,24";

      input = {
        kb_layout = "ch";
        kb_variant = "fr";
        follow_mouse = true;
        touchpad.natural_scroll = true;
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures.workspace_swipe = true;

      misc.force_default_wallpaper = 0;

      exec-once = [
        "ags"
        "pypr"
        "nm-applet"
        "waybar"
      ];
    };
  };
}
