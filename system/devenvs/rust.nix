{ pkgs, lib, config, ... }:
{
	options.devenv.rust.enable = lib.mkOption {
		type = lib.types.bool;
		default = config.devenvs.enable;
		description = "Enable Rust development environment";
	};

	config = lib.mkIf config.devenv.rust.enable {
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
	};
}
