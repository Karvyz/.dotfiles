{ pkgs, inputs, ... }:

{
  programs.zsh.enable = true;
  users.users.karviz = {
    isNormalUser = true;
    description = "Karviz";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "dialout"
      "docker"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users.karviz = import ./../home/nixos.nix;
  };
}
