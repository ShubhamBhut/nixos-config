{ pkgs, config, ... }: {

  home.packages = with pkgs; [
  pkgs.btop
  pkgs.obsidian
  pkgs.gau
  pkgs.hakrawler
  pkgs.tor
  pkgs.tor-browser-bundle-bin
  pkgs.john
  pkgs.johnny
  pkgs.sqlmap
  pkgs.burpsuite
  ];
}
