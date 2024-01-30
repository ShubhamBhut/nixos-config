{ pkgs, inputs, ... }:
let
  firefox = pkgs.callPackage ./legacy-fox.nix { inherit inputs; };
    ff-addons = import ./addons.nix { inherit inputs pkgs; };
    profile = import ./profile-main.nix { inherit ff-addons; };
in

  {
    programs.firefox = {
      enable = true;
      package = firefox;
      profiles.main = profile;
    };

    home.packages = with pkgs; [ pkgs.qutebrowser ];

    xdg.configFile.qutebrowser = {
      source = ./qutebrowser;
      recursive = true; 
    };

  }
