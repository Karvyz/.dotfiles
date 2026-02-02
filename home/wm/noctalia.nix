{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options.noctalia.enable = lib.mkEnableOption "Enable noctalia home module";

  config.programs.noctalia-shell = {
    enable = config.noctalia.enable;
    systemd.enable = true;
    settings = {
      bar = {
        position = "left";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "Clock";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }

          ];
          center = [
            {
              id = "Workspace";
              hideUnoccupied = false;
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "Network";
            }
            {
              id = "Battery";
              alwaysShowPercentage = true;
              warningThreshold = 30;
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
        };
      };
    };
  };
}
