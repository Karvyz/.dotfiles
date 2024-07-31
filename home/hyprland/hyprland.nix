{ config, pkgs, ... }:
let
	palette = config.lib.stylix.colors;
in {

	home.packages = with pkgs; [
		pyprland
		pavucontrol
		brightnessctl
		networkmanager
		blueman
	];

	wayland.windowManager.hyprland = {
		enable = true;
		extraConfig = ''
monitor=,1920x1200@120,auto,1

env = XCURSOR_SIZE,24

input {
	kb_layout = ch
	kb_variant = fr
	kb_model =
	kb_options =
	kb_rules =
	follow_mouse = 1
	touchpad {
		natural_scroll = yes 
	}
	sensitivity = 0
}

general {
	gaps_in = 5
	gaps_out = 10
	border_size = 2
	col.active_border = rgba(${palette.base0D}ff)
	col.inactive_border = rgba(${palette.base00}cc)
	layout = dwindle
	allow_tearing = false
}

decoration {
	rounding = 10
	blur {
		enabled = true
		size = 3
		passes = 1
	}
	drop_shadow = false
}

animations {
	enabled = yes
	bezier = myBezier, 0.05, 0.9, 0.1, 1.05
	animation = windows, 1, 7, myBezier
	animation = windowsOut, 1, 7, default, popin 80%
	animation = border, 1, 10, default
	animation = borderangle, 1, 8, default
	animation = fade, 1, 7, default
	animation = workspaces, 1, 6, default
}

dwindle {
	pseudotile = yes
	preserve_split = yes
}

gestures {
	workspace_swipe = on 
}

misc {
	force_default_wallpaper = 0
}

exec-once = ags
exec-once = pypr
exec-once = nm-applet

$mainMod = SUPER

bindr = SUPER, SUPER_L, exec,	ags -t hub 

bind = $mainMod, B, exec, ags -t bar
bind = $mainMod, A, exec, kitty
bind = $mainMod, E, exec, nautilus

bind = $mainMod, C, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod, F, togglefloating, 
bind = $mainMod, G, fullscreen,
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, U, exec, pkill waybar
bind = $mainMod, I, exec, waybar
bind = $mainMod, N, exec, hyprlock
bind = $mainMod, I, exec, pypr change_workspace +1
bind = $mainMod, U, exec, pypr change_workspace -1
bind = $mainMod, Q, exec, pypr toggle term
bind = $mainMod, V, exec, pypr toggle volume

bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod SHIFT, mouse:272, resizewindow

bind = , XF86MonBrightnessUp, exec, brightnessctl s +5%
bind = , XF86MonBrightnessDown, exec, brightnessctl s 5%-

bindel = , xf86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set +33%
bindel = , xf86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 33%-

bindel=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindel=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindl=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	'';
	};
}
