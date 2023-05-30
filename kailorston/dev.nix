
{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    gcc
    gdb
    rustc
    cargo
    (import ./python-packages.nix { pkgs = pkgs; })
  ];
  programs.helix.enable = true;
  programs.helix.settings = {
    theme = "github_dark";
    keys.insert.F9 = "normal_mode";
    keys.normal.a = "code_action";
    keys.normal.space.s = ":write";
    editor.cursor-shape.insert = "bar";
    editor.line-number = "relative";
  };
  home.sessionVariables.CARGO_BUILD_TARGET_DIR = "${config.home.homeDirectory}/.cargo/target";
  }
