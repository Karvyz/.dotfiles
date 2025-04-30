{
  lib,
  config,
  pkgs,
  ...
}:

let
  acc = if config.nvidia.enable then "cuda" else null;
in
{
  options = {
    ollama.enable = lib.mkEnableOption "Enable ollama module";
  };

  config = lib.mkIf config.ollama.enable {
    services.ollama = {
      enable = true;
      acceleration = acc;
    };
    environment.systemPackages = with pkgs; [
      alpaca
      llama-cpp
    ];
  };
}
