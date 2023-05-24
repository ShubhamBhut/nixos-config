{ pkgs, inputs, ... }: {
  imports = [ inputs.nix-index-database.hmModules.nix-index ];
  programs.readline = {
    enable = true;
    bindings = {
      "\\e[A" = "history-substring-search-backward";
      "\\e[B" = "history-substring-search-forward";
    };
    variables = {
      "completion-ignore-case" = "on";
      "show-all-if-ambiguous" = "on";
      "colored-stats" = "on";
      "completion-display-width" = 4;
      "enable-bracketed-paste" = "on";
    };
  };
  programs.fish = {
    enable = true;
    functions = {
      "a" = "set PATH (nix shell (string replace -r ^ nixpkgs# -- $argv) -c printenv PATH; or return)";
      "r" = "nix run nixpkgs#$argv";
    };
    shellAliases = {
      "j" = "just";
      "ls" = "exa";
      "sudo" = "doas";
    };
    interactiveShellInit = ''
      export DIRENV_LOG_FORMAT=""
    '';
  };
  programs.nix-index = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    historyLimit = 50000;
    sensibleOnTop = false;
    terminal = "alacritty";
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = builtins.readFile ./tmux.conf;
  };
  programs.starship = {
    enable = true;
  };
  home.packages = with pkgs; [
    bashInteractive
    bat
    du-dust
    exa
    file
    fd
    just
    jq
    netcat-gnu
    ripgrep
    aria2
    p7zip
  ];
}
