{ lib, config, pkgs, ... }:

{
  options = {
    zsh.enable = lib.mkOption {
      default = true;
      example = true;
      description = "Whether to enable zsh.";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}
