{inputs, pkgs, ...}: {
  programs.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  wayland.windowManager.hyprland.enable = true;
  };
}
