{ pkgs, config, ... }: {

  home.packages = with pkgs; [
  pkgs.btop
  pkgs.libxkbcommon
  pkgs.tor
  pkgs.tor-browser-bundle-bin
  pkgs.jdk
  pkgs.obsidian
  pkgs.hedgedoc
  pkgs.unzip
  pkgs.brave
  pkgs.killall
  pkgs.exercism
  pkgs.scc #code language and complexity calculator
  pkgs.mpv #audio and video player
  pkgs.libreoffice-fresh
  pkgs.vulnix
  pkgs.logseq
  ];
}
