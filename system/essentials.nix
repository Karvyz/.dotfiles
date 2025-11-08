{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    wl-clipboard
    wget
    git
  ];
}
