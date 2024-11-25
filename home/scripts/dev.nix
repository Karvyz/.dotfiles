{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "dev" ''
      	# Check if two arguments are provided
      	if [ "$#" -ne 2 ]; then
      		echo "Usage: $0 <language> <directory>"
      		exit 1
      	fi

      	# Assign arguments to variables
      	language=$1
      	directory=$2

      	# Switch case to handle different environments based on the language
      	case "$language" in
      		"rust")
      			echo Creating a rust environment in $directory
      			nix-shell -p cargo --run "cargo new $directory"
      			cd $directory
      			nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#rust"
      			;;
      		*)
      			echo Creating a generic dev environment for $language in $directory
      			mkdir -p $directory
      			cd $directory
      			nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$language"
      			;;
      	esac
      	direnv allow

      	exit 0
    '')
  ];
}
