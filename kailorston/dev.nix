
{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    gcc
    gdb
  ];
  home.sessionVariables.CARGO_BUILD_TARGET_DIR = "${config.home.homeDirectory}/.cargo/target";
  }
