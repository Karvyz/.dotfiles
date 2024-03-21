#!/bin/sh

# Automated script to install my dotfiles

# Clone dotfiles
nix-shell -p git --command "git clone https://github.com/Karvyz/.dotfiles ~/.dotfiles"

# Generate hardware config for new system
sudo nixos-generate-config --show-hardware-config > ~/.dotfiles/system/hardware-configuration.nix

# Rebuild system
sudo nixos-rebuild switch --flake ~/.dotfiles
