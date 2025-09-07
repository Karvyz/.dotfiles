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
    ./rmbrs.nix
    ./seti.nix
  ];

  options = {
    theme = lib.mkOption {
      type = lib.types.enum [
        "ashes"
        "ira"
        "rmbrs"
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
      rmbrs.enable = lib.mkDefault (config.theme == "rmbrs");
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
