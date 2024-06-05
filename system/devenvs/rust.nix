{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		rustup

		# essentials
		pkg-config
		alsa-lib
		udev
		lld
		dbus
		cmake
		gnumake
		clang
		fontconfig

		# x11
		xorg.libX11
		xorg.libXinerama
		xorg.libXft
		xorg.libXcursor
		xorg.libXi
		xorg.libXrandr

		#	wayland
		libxkbcommon
		wayland
	];
}
