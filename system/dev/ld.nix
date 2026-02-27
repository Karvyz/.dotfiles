{ pkgs, ... }:

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
      libX11
      libXcursor
      libXi
      libXrandr
      # If on wayland
      libxkbcommon
      wayland
    ];
  };
}
