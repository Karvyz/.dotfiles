#!/usr/bin/env bash

# Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sudo sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# Git
git clone https://github.com/Karvyz/.dotfiles.git && cd .dotfiles
git remote set-url origin git@github.com:Karvyz/.dotfiles.git

# Cachix
echo trusted-users = root karviz | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon

# Home-manger
nix run home-manager/master -- switch --flake .

# Hyprland
nix profile install github:guibou/nixGL --impure
sudo ln -s /home/$USER/.dotfiles/home/hyprland/nixprland.desktop /usr/share/wayland-sessions/nixprland.desktop

# SSH
ssh-keygen -t ed25519
