{ config, pkgs, ... }:
{
  services = {
    nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts."localhost" = {
        locations."/" = {
          proxyPass = "http://localhost:3333";
        };
        locations."/socket.io/" = {
          proxyPass = "http://localhost:3333";
          proxyWebsockets = true;
        };
      };
    };

    hedgedoc = {
      enable = true;
      settings = {
        db = {
          dialect = "sqlite";
          storage = "/var/lib/hedgedoc/db.hedgedoc.sqlite";
        };
        domain = "localhost";
        port = 3333;
        useSSL = false;
        protocolUseSSL = false;
      };
    };
  };

  # Ensure the HedgeDoc data directory exists and has correct permissions
  system.activationScripts = {
    hedgedoc-data-dir = {
      text = ''
        mkdir -p /var/lib/hedgedoc
        chown -R hedgedoc:hedgedoc /var/lib/hedgedoc
      '';
      deps = [];
    };
  };
}
