
{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    gcc
    gdb
    rustc
    cargo
    (import ./python-packages.nix { pkgs = pkgs; })
  ];
  home.sessionVariables.CARGO_BUILD_TARGET_DIR = "${config.home.homeDirectory}/.cargo/target";
  }
