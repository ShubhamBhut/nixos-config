{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      bungcip.better-toml
      esbenp.prettier-vscode
      rust-lang.rust-analyzer
      ms-pyright.pyright
      ms-toolsai.jupyter
    ];
  };
}
