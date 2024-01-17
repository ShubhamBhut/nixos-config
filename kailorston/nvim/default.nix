{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
  };
  xdg.configFile.nvim = {
    source = ./.;
    recursive = true;
  };
  home.packages = [pkgs.rust-analyzer pkgs.nodePackages.pyright pkgs.nodePackages_latest.typescript-language-server pkgs.nodePackages.vscode-langservers-extracted pkgs.lua-language-server pkgs.ocamlPackages.ocaml-lsp];
  }
