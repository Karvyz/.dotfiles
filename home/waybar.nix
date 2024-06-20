{ config, ... }:
let
	palette = config.lib.stylix.colors;
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in {
	programs.waybar = {
    enable = false;
    settings = [{
      layer = "top";
      position = "top";

      modules-center = [ "hyprland/workspaces" ] ;
      modules-left = [ "hyprland/window" "pulseaudio" "cpu" "memory"];
      modules-right = [ "tray" "network" "battery" "clock" ];

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
				format = '' {:L%H:%M}'';
      	tooltip = true;
				tooltip-format = "<tt><small>{calendar}</small></tt>";
      };
      "hyprland/window" = {
      	max-length = 25;
        separate-outputs = false;
        rewrite = { "" = " None "; };
      };
      "memory" = {
      	interval = 5;
      	format = " {}%";
        tooltip = true;
      };
      "cpu" = {
      	interval = 5;
      	format = " {usage:2}%";
        tooltip = true;
      };
      "disk" = {
        format = " {free}";
        tooltip = true;
      };
      "network" = {
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        format-ethernet = " {bandwidthDownOctets}";
        format-wifi = "{icon} {signalStrength}%";
        format-disconnected = "󰤮";
        tooltip = false;
      };
      "tray" = {
        spacing = 12;
      };
      "pulseaudio" = {
        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "sleep 0.1 && pavucontrol";
      };
      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = "󱘖 {capacity}%";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        on-click = "";
        tooltip = false;
      };
    }];
    style = ''
      * {
				font-size: 16px;
				font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
    		font-weight: bold;
      }
			window#waybar {
				background: transparent;
      }
			.module {
				padding: 0 10px;
				background: #${palette.base01};
				border-radius: 10px;
				margin: 10px 10px 0 0;
			}

			#window {
				margin-left: 10px;
				color: #${palette.base05};
      }
			#pulseaudio {
				color: #${palette.base0D};
			}
			#cpu {
				color: #${palette.base07};
			}
			#memory {
				color: #${palette.base0F};	
			}

			#workspaces {
				padding: 0px 1px;
				border-radius: 15px;
				border: 0px;
				font-style: normal;
				color: #${palette.base00};
      }
      #workspaces button {
				padding: 0px 5px;
				margin: 4px 3px;
				border-radius: 10px;
				border: 0px;
				color: #${palette.base00};
        background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
        background-size: 300% 300%;
				opacity: 0.5;
				transition: ${betterTransition};
			}
      #workspaces button.active {
				opacity: 1.0;
				min-width: 40px;
			}
      #workspaces button:hover {
				opacity: 0.8;
      }


			#network {
				color: #${palette.base09};
			}
			#battery {
				color: #${palette.base08};
			}
			#clock {
				color: #${palette.base01};
        background: linear-gradient(45deg, #${palette.base0C}, #${palette.base0F}, #${palette.base0B}, #${palette.base08});
        background-size: 300% 300%;
			}
			'';
  };
}
