{
  config,
  lib,
  pkgs,
  ...
}:
let
  position = "top";

  barDirection = if (position == "left") || (position == "right") then "vertical" else "horizontal";

  mkGroup = modules: {
    inherit modules;
    orientation = barDirection;
  };

  mkDrawer = modules: (mkGroup modules) // { drawer.transition-duration = 250; };
  mkDrawerRtl = modules: (mkDrawer modules) // { drawer.transition-left-to-right = false; };

  mkClockModule = format: interval: tooltip: {
    inherit format interval tooltip;
    timezone = "Europe/Paris";
    on-click = "kitty --title=clock-popup ${lib.getExe pkgs.tty-clock} -scbn";
  };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings.default = {
      layer = "top";
      inherit position;
      spacing = 5;

      # managed with struts at the bottom
      exclusive = false;

      modules-left = [
        "group/vclock"
        "group/vdate"
      ];
      modules-right = [
        "group/right"
      ];

      "group/vclock" = mkDrawer [
        "group/vclock-small"
        "clock#second"
      ];
      "group/vclock-small" = mkGroup [
        "clock#hour"
        "clock#minute"
      ];
      "group/vdate" = mkDrawer [
        "group/vdate-small"
        "clock#year"
      ];
      "group/vdate-small" = mkGroup [
        "clock#day"
        "clock#month"
      ];

      "group/right" = mkGroup [
        "tray"
        "pulseaudio"
        "backlight"
        "battery"
        "network"
      ];

      "clock#hour" = mkClockModule "{:%H}" 60 false;
      "clock#minute" = mkClockModule "{:%M}" 60 false;
      "clock#second" = mkClockModule "{:%S}" 1 false;
      "clock#day" = mkClockModule "{:%d}" 60 true;
      "clock#month" = mkClockModule "{:%m}" 60 true;
      "clock#year" = mkClockModule "{:%y}" 60 true;

      "pulseaudio" = {
        format = "{icon}";
        tooltip-format = "{volume}%";
        format-muted = "";
        format-icons = {
          headphone = "";
          default = [
            ""
            ""
            ""
          ];
        };
        on-click = "pavucontrol";
        scroll-step = 5.;
      };

      "backlight" = {
        format = "{icon}";
        tooltip-format = "{percent}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
        device = "amdgpu_bl1";
        scroll-step = 5.;
      };

      "battery" = {
        format = "{icon}";
        format-time = "{H}:{m}";
        tooltip-format = "{capacity}% | {time} | {power} Watts";
        states.critical = 15;
        format-charging = "";
        format-plugged = "";
        format-icons = [
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
      };

      "network" = {
        format = "{icon}";
        tooltip-format = "{ifname} | {ipaddr} | {essid}";
        format-icons = [
          "󰤯"
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
        on-click = "kitty impala";
      };

      "tray" = {
        spacing = 10;
        show-passive-items = true;
      };
    };

    style = ''
      * {
        font-family: monospace;
      }

      window#waybar {
        background-color: transparent;
        color: @text;
      }
      window#waybar > box {
        padding: 5px;
      }

      #window,
      #vclock,
      #vdate,
      #right {
        background-color: ${config.lib.stylix.colors.withHashtag.base00};
        border-radius: 5px;
        padding: 5px;
      }

      #window {
        margin-bottom: 5px;
      }
    '';
  };
}
