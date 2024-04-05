{ pkgs, config, ... }: {

  home.packages = with pkgs; [
  pkgs.btop
  pkgs.tor
  pkgs.tor-browser-bundle-bin
  pkgs.jdk
  pkgs.obsidian
  pkgs.unzip
  pkgs.brave
  pkgs.killall
  pkgs.exercism
  pkgs.scc
  pkgs.mpv
  pkgs.youtube-dl
  pkgs.picard
  ];
}
