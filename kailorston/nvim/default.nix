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
  home.packages = [pkgs.rust-analyzer pkgs.nodePackages.pyright pkgs.vimPlugins.emmet-vim pkgs.nodePackages_latest.typescript-language-server];
  }
