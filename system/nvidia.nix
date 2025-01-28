{ lib, ... }:
{
  options = {
    nvidia.enable = lib.mkEnableOption "Enable nvidia module";
  };
}
