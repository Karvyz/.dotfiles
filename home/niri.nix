{ config, ... }:
{
  programs.niri = {
    settings = {
      input = {
        keyboard.xkb.layout = "ch(fr)";
        focus-follows-mouse.enable = true;
      };

      outputs."eDP-1".scale = 1;
      prefer-no-csd = true;
      layout = {
        gaps = 10;
        border.width = 2;
      };

      binds = with config.lib.niri.actions; {
        "Mod+Z".action = show-hotkey-overlay;
        "Mod+D".action.spawn = "anyrun";
        "Mod+C".action = close-window;
        "Mod+Alt+L".action.spawn = "hyprlock";
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Shift+E".action.quit.skip-confirmation = true;

        "Mod+P".action = screenshot;
        "Mod+Shift+P".action = screenshot-window;

        "Mod+A".action.spawn = "kitty";
        "Mod+E".action.spawn = "nautilus";
        "Mod+B".action.spawn = "firefox";

        "XF86MonBrightnessUp".action.spawn-sh = "brightnessctl set 10%+";
        "XF86MonBrightnessDown".action.spawn-sh = "brightnessctl set 10%-";
        "XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
        "XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        "XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      };
    };
  };
}
