{
  lib,
  config,
  pkgs,
  ...
}:
let
  palette = config.lib.stylix.colors.withHashtag;
in
{
  options.anyrun.enable = lib.mkEnableOption "Enable anyrun home module";
  config.programs.anyrun = {
    enable = config.anyrun.enable;
    config = {
      y.fraction = 0.4;
      width.fraction = 0.4;
      hidePluginInfo = true;
      ignoreExclusiveZones = true;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
      ];
    };

    extraConfigFiles."shell.ron".text = ''
      Config(
        prefix: "",
        shell: None,
      )
    '';

    extraCss = ''
      @define-color window-background-color ${palette.base00};
      @define-color entry-background-color ${palette.base01};
      @define-color border-color ${palette.base0D};

      window {
        background: transparent;
      }

      box.main {
        padding: 5px;
        border-radius: 10px;
        border: 2px solid @border-color;
        background-color: @window-background-color;
        box-shadow: 0 0 5px black;
      }

      box.main.text {
        color: #FF0000;
        background-color: #00FF00;
        border-color: #0000FF;
      }

      text {
        min-height: 30px;
        padding: 5px;
        border-radius: 5px;
      }

      .matches {
        border-radius: 10px;
      }

      box.plugin:first-child {
        margin-top: 5px;
      }

      box.plugin.info {
        min-width: 200px;
      }

      label.match.description {
        font-size: 10px;
      }

      label.plugin.info {
        font-size: 14px;
      }

      .match {
        background: transparent;
      }

      .match:selected {
        border-left: 4px solid @border-color;
        background: transparent;
        animation: fade 0.1s linear;
      }

      @keyframes fade {
        0% {
          opacity: 0;
        }

        100% {
          opacity: 1;
        }
      }
    '';
  };
}
