{ config, ... }:
let
	palette = config.lib.stylix.colors;
in {
	programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "left";
			margin = "10px 0";

      modules-left = [ "hyprland/workspaces" ];
      modules-right = [ "tray" "pulseaudio" "group/system" "network" "battery" "clock" ];

      "hyprland/workspaces" = {
      	format = "{name}";
      	format-icons = {
          default = " ";
          active = " ";
          urgent = " ";
      	};
      	on-scroll-up = "hyprctl dispatch workspace e+1";
      	on-scroll-down = "hyprctl dispatch workspace e-1";
      };
      "clock" = {
				format = "{:%H\n%M}";
				tooltip = false;
				on-click = "gnome-calendar";
      };
      "memory" = {
      	interval = 5;
      	format = "";
        tooltip = true;
      };
      "cpu" = {
      	interval = 5;
      	format = "";
        tooltip = true;
      };
      "network" = {
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        format-ethernet = " ";
        format-wifi = "{icon}";
        format-disconnected = "󰤮 ";
        tooltip = false;
      };
      "tray" = {
        spacing = 12;
      };
      "pulseaudio" = {
        format = "{icon}";
        format-bluetooth = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "pavucontrol";
      };
      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon}";
        format-charging = "󰂄";
        format-plugged = "󱘖";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        on-click = "";
        tooltip = true;
      };

			"group/system" = {
				orientation = "inherit";
				drawer = {
					"transition-left-to-right" = false;
				};
				modules = [ "power-profiles-daemon" "cpu" "memory" ];
			};
			"power-profiles-daemon" = {
				"format" = "{icon}";
				"tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
				"tooltip" = true;
				"format-icons" = {
					"default" = " ";
					"performance" = " ";
					"balanced" = " ";
					"power-saver" = " ";
				};
			};
    }];
    style = ''
		* {
			font-size: 16px;
			font-family: FiraCode Nerd Font, Font Awesome, sans-serif;
   		font-weight: bold;
			opacity: 1;
    }
		window#waybar {
			background-color: #${palette.base00};
			opacity: 0.85;
			border-radius: 16px;
		}
    .modules-left {
			background-color: #${palette.base01};
			border-radius: 16px;
		} 
		.modules-right {
			background-color: #${palette.base01};
			border-radius: 16px;
		}

		.module {
			margin: 8px 0;
		}
			'';
  };
}
