{ lib, ... }:
{
  options = {
    stylix.borders = {
      radius = lib.mkOption {
        description = "The radius of the windows borders";
        type = lib.types.ints.unsigned;
        default = 0;
      };
      width = lib.mkOption {
        description = "The width of the windows borders";
        type = lib.types.ints.unsigned;
        default = 2;
      };
    };
  };
}
