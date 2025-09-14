{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "nr" ''
      usage() {
        echo "Usage:"
        echo "  nr program [arguments...]          # Run program with given arguments"
        echo "  nr program -c launch-name [arguments...]  # Run program with custom launch name"
        echo ""
        echo "Examples:"
        echo "  nr hello                           # Runs: nix-shell -p hello --run hello"
        echo "  nr python3 -c mypython script.py   # Runs: nix-shell -p python3 --run 'mypython script.py'"
        echo "  nr node -c webserver app.js        # Runs: nix-shell -p node --run 'webserver app.js'"
      }

      # Check if at least one argument is provided
      if [ $# -lt 1 ]; then
        echo "Error: No program specified"
        usage
        exit 1
      fi

      # Initialize variables
      program=""
      launch_name=""

      # Parse arguments
      program="$1"
      launch_name="$1"
      shift

      # Check if -c flag is present for custom launch name
      if [ $# -gt 1 ] && [ "$1" = "-c" ]; then
        launch_name="$2"
        shift 2 # Remove -c and launch-name from arguments
      fi

      # Execute the nix-shell command
      nix-shell -p "$program" --run "$launch_name $*"
    '')
  ];
}
