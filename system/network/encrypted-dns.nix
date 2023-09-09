{ ... }: {
  # encrypted dns
  networking.nameservers = [ "127.0.0.1" "::1" ];
  networking.networkmanager.dns = "none";
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      sources.relays = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
          "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
          "https://ipv6.download.dnscrypt.info/resolvers-list/v3/relays.md"
          "https://download.dnscrypt.net/resolvers-list/v3/relays.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/relays.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [
        "cloudflare"
        # "quad9-dnscrypt-ip4-nofilter-ecs-pri"
      ];

      # hopefully something in future
      # anonymized_dns = {
      #   routes = [
      #     {
      #       server_name = "*";
      #       via = [
      #         "anon-saldnssg01-conoha-ipv4"
      #         "anon-tiarap-ipv6"
      #         "anon-cs-berlin"
      #         "anon-inconnu"
      #         "anon-cs-fr"
      #       ];
      #     }
      #   ];
      #   skip_incompatible = true;
      # };
    };
  };
}
