{ lib, config, pkgs, ... } :

{
  options = {
    virtualization.enable = lib.mkEnableOption "Enable virtualization module";
  };

  config = lib.mkIf config.virtualization.enable {
    environment.systemPackages = with pkgs; [
      virtiofsd
			gnome.gnome-boxes
	
			distrobox
			dive            # look into docker image layers
    	docker-compose  # start group of containers for dev
			nvidia-container-toolkit
    ];
  
    virtualisation =  {
			libvirtd.enable = true;
    	spiceUSBRedirection.enable = true;

			containers.enable = true;
			docker = {
				enable = true;
				rootless = {
  				enable = true;
					setSocketVariable = true;
				};
			};
		};
  };
}
