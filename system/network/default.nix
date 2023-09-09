{ ... }: {
  networking.firewall.enable = false;
  networking.useDHCP = false;
  imports = [ ./network-manager.nix ./warp.nix ./bluetooth.nix ];
}
