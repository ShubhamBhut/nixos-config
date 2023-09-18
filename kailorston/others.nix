{ pkgs, config, ... }: {

  home.packages = with pkgs; [
  pkgs.btop
  pkgs.obsidian
  pkgs.tor
  pkgs.tor-browser-bundle-bin
  pkgs.jdk
  pkgs.unzip
  pkgs.brave
  ];
}
