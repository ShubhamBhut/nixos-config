
{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    gcc
    clang-tools
    gdb
    rustc
    cargo
    (import ./python-packages.nix { pkgs = pkgs; })
    pkgs.nodePackages.live-server
    nodejs_20
    yarn
    pkgs.nodePackages.svelte-language-server
    typescript
    poetry
    steam-run
    bitcoind
  ];
  programs.helix.enable = true;
  programs.helix.settings = {
    theme = "dracula_at_night";
    keys.insert.F9 = "normal_mode";
    keys.normal.a = "code_action";
    keys.normal.space.s = ":write";
    editor.cursor-shape.insert = "bar";
    editor.line-number = "relative";
  };
  home.sessionVariables.CARGO_BUILD_TARGET_DIR = "${config.home.homeDirectory}/.cargo/target";
  }
