{ pkgs, config, ... }: {

  home.packages = with pkgs; [
  pkgs.btop
  pkgs.gau
  pkgs.hakrawler
  ];
}
