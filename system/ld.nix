{ lib, config, pkgs, ... } :

{
	programs.nix-ld = {
		enable = true;
		libraries = with pkgs; [
			pkg-config
			alsa-lib
			vulkan-tools
			vulkan-headers
			vulkan-loader
			vulkan-validation-layers
			udev
			clang
			lld
			# If on x11
			xorg.libX11
			xorg.libXcursor
			xorg.libXi
			xorg.libXrandr
			# If on wayland
			libxkbcommon
			wayland
		];
	};
}
