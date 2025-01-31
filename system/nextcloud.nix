{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    nextcloud.enable = lib.mkEnableOption "Enable Nextcloud Server module";
  };

  config = lib.mkIf config.nextcloud.enable {
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud30;
      hostName = "localhost";
      config = {
        dbtype = "sqlite";
        adminpassFile = "/etc/nextcloud-admin-pass";
      };
      settings.trusted_domains = [ "192.168.1.*" ];
    };
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
  };
}
