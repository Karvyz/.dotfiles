#!/bin/bash

# Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
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
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.nixGLIntel
sudo ln -s /home/$USER/.dotfiles/home/hyprland/nixprland /bin/nixprland
sudo ln -s /home/$USER/.dotfiles/home/hyprland/nixprland.desktop /usr/share/wayland-sessions/nixprland.desktop

# Zsh 
echo /home/$USER/.nix-profile/bin/zsh | sudo tee -a /etc/shells
chsh -s /home/$USER/.nix-profile/bin/zsh

# SSH
ssh-keygen -t ed25519
