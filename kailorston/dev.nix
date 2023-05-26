
{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    gcc
    gdb
    rustc
    cargo
    neo4j
    (import ./python-packages.nix { pkgs = pkgs; })
  ];
  home.sessionVariables.CARGO_BUILD_TARGET_DIR = "${config.home.homeDirectory}/.cargo/target";
  }
