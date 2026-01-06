{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "nd" ''
      FILENAME=".nix-profile"

      if [ -f "$FILENAME" ]; then
          echo "Found nix profile"
          nix develop ./.nix-profile 
      else
          echo "Nix profile not found, creating..."
          nix develop --profile ./.nix-profile 

          if [ -f .gitignore ]; then
              if ! grep -q ".nix-profile" .gitignore; then
                  echo ".nix-profile*" >> .gitignore
                  echo "Added nix profile to .gitignore"
              fi
          fi
      fi
    '')
  ];
}
