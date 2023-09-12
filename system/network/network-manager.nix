{ ... }: {
  networking.networkmanager.enable = true;
  # random mac address
  networking.networkmanager.wifi.macAddress = "stable";
  networking.networkmanager.ethernet.macAddress = "stable";
  systemd.services.NetworkManager-wait-online.enable = false; # slows down bootup
}
