{ ... }: {
  systemd.network.enable = true;
  systemd.network.networks."10-lan" = {
    matchConfig.Name = "en*";
    networkConfig.DHCP = "ipv4";
    networkConfig.IgnoreCarrierLoss = "yes";
  };
  systemd.network.wait-online.enable = false;
}
