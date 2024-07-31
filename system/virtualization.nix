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
    	podman-tui      # status of containers in the terminal
    	podman-compose  # start group of containers for dev
    ];
  
    virtualisation =  {
			libvirtd.enable = true;
    	spiceUSBRedirection.enable = true;

			containers.enable = true;
			podman = {
				enable = true;

				# Create a `docker` alias for podman, to use it as a drop-in replacement
				dockerCompat = true;

				# Required for containers under podman-compose to be able to talk to each other.
				defaultNetwork.settings.dns_enabled = true;
			};
		};
  };
}
