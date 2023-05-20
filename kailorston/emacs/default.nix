{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };
  xdg.configFile.emacs = {
    source = ./.;
    recursive = true;
  };
}
