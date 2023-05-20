{ ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
  };
  xdg.configFile.nvim = {
    source = ./.;
    recursive = true;
  };
  }
