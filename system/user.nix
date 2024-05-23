{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.karviz = {
    isNormalUser = true;
    description = "Karviz";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "dialout" ];
  };
}
