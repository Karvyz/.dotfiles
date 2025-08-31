{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./ashes.nix
    ./ira.nix
    ./seti.nix
  ];

  options = {
    theme = lib.mkOption {
      type = lib.types.enum [
        "ashes"
        "ira"
        "seti"
      ];
      default = "seti";
      description = "Which theme to enable";
    };
  };

  config = {
    themes = {
      ashes.enable = lib.mkDefault (config.theme == "ashes");
      ira.enable = lib.mkDefault (config.theme == "ira");
      seti.enable = lib.mkDefault (config.theme == "seti");
    };

    stylix = {
      enable = true;
      polarity = "dark";
      cursor = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
      };
      fonts.sizes.popups = 12;
    };
  };
}
