{ pkgs, inputs, lib, ... }: {
  xdg.configFile.alacritty = {
    source = ./.;
    recursive = true;
  };
  xdg.configFile.kitty = {
    source = ./.;
    recursive = true;
  };
  xdg.configFile.current-theme = {
    source = ./.;
    recursive = true;
  };
  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
  programs.kitty = {
    enable = true;
  };
  programs.kitty.settings.shell = "${pkgs.fish}/bin/fish";
 
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
  programs.alacritty.enable = true;
  programs.alacritty.settings.shell = "tmux";
  programs.fish = {
    enable = true;
    functions = {
      "a" = "set PATH (nix shell (string replace -r ^ nixpkgs# -- $argv) -c printenv PATH; or return)";
      "r" = "nix run nixpkgs#$argv";
    };
    shellAliases = {
      "j" = "just";
      "ls" = "exa";
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
    terminal = "kitty";
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = builtins.readFile ./tmux.conf;
  };
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_commit$character";
      right_format = lib.strings.concatStrings [
        "$cmd_duration"
        "$nix_shell"
      ];
      git_branch.format = "\\([$branch](purple)\\) ";
      git_commit.format = "\\([$hash](purple)\\) ";
      character = {
        success_symbol = "[λ](yellow)";
        error_symbol = "[λ](red)";
      };
      directory.style = "cyan";
      nix_shell.format = "[$symbol](blue)";
    };
  };
  home.packages = with pkgs; [
    bashInteractive
    bat
    du-dust
    eza
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
