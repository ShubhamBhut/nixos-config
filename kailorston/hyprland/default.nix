{ config, lib, pkgs, ... }:
{

  home.packages = with pkgs; [ wl-clipboard slurp grim rofi brightnessctl mpd light cava hyprpaper swappy];
  
xdg.configFile.hypr = {
    source = ./hypr;
    recursive = true; 
    };
xdg.configFile.rofi = {
    source = ./rofi;
    recursive = true;
    };
}
