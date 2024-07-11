#!/bin/bash

# Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# Git
git clone https://github.com/Karvyz/.dotfiles.git && cd .dotfiles
git remote rm origin
git remote add origin git@github:Karvyz/.dotfiles.git

# Cachix
echo trusted-users = root karviz | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon

# Home-manger
nix run home-manager/master -- switch --flake .

# Configuration
echo /home/$USER/.nix-profile/bin/zsh | sudo tee -a /etc/shells
chsh -s /home/$USER/.nix-profile/bin/zsh

# SSH
ssh-keygen -t ed25519
