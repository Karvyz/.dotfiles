{ lib, config, ... }:
{
	options = {
    devenvs.enable = lib.mkEnableOption "Enable devenvs module";
  };

	imports = [
		./rust.nix
	];
}
