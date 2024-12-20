
{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    aider-chat
    gcc
    cmake
    libsForQt5.full.out
    # libstdcxx5
    # zed-editor
    difftastic
    clang-tools
    jujutsu
    gdb
    go
    rustc
    cargo
    rustfmt
    clippy
    # erlang
    # gleam
    godot_4
    (import ./python-packages.nix { pkgs = pkgs; })
    pkgs.nodePackages.live-server
    nodejs_22
    yarn
    pkgs.nodePackages.svelte-language-server
    typescript
    steam-run
    # bitcoind
    # julia-bin
    opam
    dune_3
    gnumake
    bubblewrap
    redis
    sqlite
    nginx
    wtype
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
