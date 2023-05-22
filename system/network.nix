{ ... }: {
  networking = {
    networkmanager.enable = true;
    wireless.enable = false;
    firewall.enable = false;
    dhcpcd.enable = false;
    useDHCP = true;
  };
