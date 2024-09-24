{ inputs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = false;

    configDir = ./ags;
  };
}
