{ inputs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--print-build-logs"
    ];
    randomizedDelaySec = "45min";
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 14d";
  };
}
