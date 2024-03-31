#!/bin/sh

# Automated script to install my dotfiles

# Clone dotfiles
nix-shell -p git --command "git clone https://github.com/Karvyz/.dotfiles ~/.dotfiles"

# Generate hardware config for new system
sudo nixos-generate-config --show-hardware-config > ~/.dotfiles/modules/hardware-configuration.nix

echo "Please choose the host:"
echo "1. orion"
echo "2. polaris"
read -p "Enter your choice (1 or 2): " choice

# Rebuild system using the user choice
case $choice in
    1)
        echo "You chose orion."
	nix-shell -p git --command "sudo nixos-rebuild switch --flake ~/.dotfiles#orion"
        ;;
    2)
        echo "You chose polaris."
	nix-shell -p git --command "sudo nixos-rebuild switch --flake ~/.dotfiles#polaris"
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        ;;
esac

# Cleanup
nix-collect-garbage -d
