{ pkgs, lib, ... }: {
 home.packages = with pkgs; [ wl-clipboard slurp grim rofi brightnessctl ];
  programs.waybar.enable = true;
  programs.waybar.style = ./waybar.css;
  programs.waybar.settings = {
    "bar-0" = {
      ipc = true;
      layer = "top";
      position = "top";
      height = 22;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-right = [ "battery" "clock" "tray" ];
      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
      };
    };
  };
}
