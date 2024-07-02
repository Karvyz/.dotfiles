{ lib, config, pkgs, ... } :

{
  options = {
    virtualization.enable = lib.mkEnableOption "Enable virtualization module";
  };

  config = lib.mkIf config.virtualization.enable {
    environment.systemPackages = with pkgs; [
      virtiofsd
			gnome.gnome-boxes
    ];
  
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
