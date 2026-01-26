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

  programs.noctalia-shell.enable = config.noctalia-shell.enable;
}
