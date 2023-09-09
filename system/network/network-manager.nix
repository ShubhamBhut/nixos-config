{ ... }: {
  networking.networkmanager.enable = true;
  # random mac address
  networking.networkmanager.wifi.macAddress = "stable";
  networking.networkmanager.ethernet.macAddress = "stable";
  persist.stateDir."network-manager/connections" = "/etc/NetworkManager/system-connections";
  persist.stateDir."network-manager/state" = "/var/lib/NetworkManager";
  systemd.services.NetworkManager-wait-online.enable = false; # slows down bootup
}
