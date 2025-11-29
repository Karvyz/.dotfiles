{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.niri.enable && config.programs.waybar.enable) {
    home.packages = [
      (pkgs.writeShellScriptBin "niri-waybar" ''
        sleep 2
        niri msg event-stream | while IFS= read -r line; do
          if [[ "$line" == "Overview toggled"* ]]; then
            echo "Overview toggled detected, refreshing waybar..."
            pkill -USR1 waybar
          fi
        done
      '')
    ];
  };
}
