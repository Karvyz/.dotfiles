{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bindr = "SUPER, SUPER_L, exec,	rofi -show drun";

    bind = [
      "$mainMod, B, exec, ags -t bar"
      "$mainMod, A, exec, kitty"
      "$mainMod, E, exec, nautilus"

      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, F, togglefloating,"
      "$mainMod, G, fullscreen,"
      "$mainMod, N, exec, hyprlock"
      "$mainMod, I, exec, hyprshot -m region"
      "$mainMod SHIFT, I, exec, hyprshot -m window"
      "$mainMod, O, exec, rofi -show calc"
      "$mainMod, Q, exec, pypr toggle term"
      "$mainMod, P,	exec, pypr toggle updater"
      "$mainMod, V, exec, pypr toggle volume"

      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod SHIFT, mouse:272, resizewindow"
    ];

    bindel = [
      ", xf86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set +33%"
      ", xf86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 33%-"

      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];
  };
}
