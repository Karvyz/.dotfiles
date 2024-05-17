# Nixos config

All my configurations files
## Installation

### Nixos
Run this command

```bash
curl -O https://raw.githubusercontent.com/Karvyz/.dotfiles/main/install.sh && bash install.sh && rm install.sh
```

### Other

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
echo experimental-features = flakes nix-command >> /etc/nix/nix.conf
git clone https://github.com/Karvyz/.dotfiles.git && cd .dotfiles
nix run home-manager/master -- switch --flake .
```
