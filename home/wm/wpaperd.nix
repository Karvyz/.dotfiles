{ lib, config, ... }:
{
  options.wpaperd.enable = lib.mkEnableOption "Enable wpaperd home module";

  config.services.wpaperd.enable = config.wpaperd.enable;
}
