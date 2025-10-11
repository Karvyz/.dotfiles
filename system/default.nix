{ inputs, ... }:
{
  imports = [
    ./boot.nix
    ./desktop.nix
    ./dev
    ./essentials.nix
    ./flatpak.nix
    ./fonts.nix
    ./games.nix
    ./gnome.nix
    ./kanata.nix
    ./kde.nix
    ./locales.nix
    ./network.nix
    ./nextcloud.nix
    ./nvidia.nix
    ./sound.nix
    ./updates.nix
    ./user.nix
    ./wm
    ./xdg.nix
    ./xserver.nix
  ];

  nix = {
    # Enable Flakes
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Assert that system nixpkgs is the same as the one used in the flake
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
