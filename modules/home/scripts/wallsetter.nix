{ pkgs, ... }:
{
	home.packages = [
    (pkgs.writeShellScriptBin "wp-init" ''
    	swww-daemon &
			wp-switch
    '')
    (pkgs.writeShellScriptBin "wp-switch" ''
			# Set the directory path
			directory="~/.dotfiles/modules/home/wallpapers"

			# Check if the directory exists
			if [ ! -d "$directory" ]; then
					echo "Directory not found!"
					exit 1
			fi

			# Get a random file from the directory
			img=$(find "$directory" -type f | shuf -n 1)

			# Set the wallpaper
			swww img "$img"
    '')
	];
}
