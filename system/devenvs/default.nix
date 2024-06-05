{ lib, config, ... }:
{
	options = {
    devenvs.enable = lib.mkEnableOption "Enable devenvs module";
  };

  config = lib.mkIf config.devenvs.enable {
		imports = [
			./rust.nix
		];
	};
}
