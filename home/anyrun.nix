{
  config,
  pkgs,
  ...
}:
let
  palette = config.lib.stylix.colors.withHashtag;
in
{
  programs.anyrun = {
    enable = true;
    config = {
      y.fraction = 0.4;
      width.fraction = 0.4;
      height.fraction = 0.4;
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
      --
      @define-color window-background-color ${palette.base00};
      @define-color entry-background-color ${palette.base01};
      @define-color border-color ${palette.base05};

      window {
        background-color: @window-background-color;
        border-radius: 12px;
        border: 2px solid @border-color;
        margin: 12px;
      }

      entry {
        background-color: @entry-background-color;
        border: 2px solid @border-color;
        box-shadow: none;
        padding: 0px 8px;
        font-size: 14px;
      }
    '';
  };
}
