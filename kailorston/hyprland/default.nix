{ config, lib, pkgs, ... }:
{

  home.packages = with pkgs; [ wl-clipboard slurp grim rofi brightnessctl mpd light hyprpaper swappy hyprcursor];
  
xdg.configFile.hypr = {
    source = ./hypr;
    recursive = true; 
    };
xdg.configFile.rofi = {
    source = ./rofi;
    recursive = true;
    };
}
