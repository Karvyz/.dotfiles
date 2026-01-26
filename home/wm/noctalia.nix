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

  config.programs.noctalia-shell.enable = config.noctalia.enable;
}
