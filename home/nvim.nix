{ config, pkgs, ... }:

{
  home.file.nvim = {
    enable = true;
    source = ./nvim;
    target = ".config/nvim";
  };
}
