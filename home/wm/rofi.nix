{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.rofi.enable = lib.mkEnableOption "Enable rofi home module";
  config.programs.rofi = {
    enable = config.rofi.enable;
    cycle = true;
    location = "center";
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # Holds the entire window
        "#window" = {
          border = mkLiteral "2px";
          border-radius = mkLiteral "10px";
          width = mkLiteral "25%";
        };

        # Wrapper around bar and results
        "#mainbox" = {
          padding = mkLiteral "10px";
        };

        # Command prompt left of the input
        "#prompt" = {
          enabled = false;
        };

        # Actual text box
        "#entry" = {
          expand = true;
          horizontal-align = "0";
          placeholder = "";
          padding = mkLiteral "0px 0px 0px 5px";
          blink = true;
        };

        # Top bar
        "#inputbar" = {
          border = mkLiteral "2px";
          border-radius = mkLiteral "16px";
          padding = mkLiteral "8px 16px";
          spacing = "8px";
        };

        # Results
        "#listview" = {
          columns = 1;
          margin = mkLiteral "12px 0 0";
        };

        # Each result
        "#element" = {
          border-radius = mkLiteral "16px";
          padding = mkLiteral "8px 16px";
          spacing = "8px";
        };
      };
    extraConfig = {
      show-icons = true;
      kb-cancel = "Escape,Super+space";
      modi = "window,run,ssh,emoji,calc";
      sort = true;
    };
  };
}
