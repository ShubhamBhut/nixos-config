{ pkgs, inputs, ... }:
let
firefox = pkgs.callPackage ./legacy-fox.nix { inherit inputs; };
ff-addons = import ./addons.nix {
  ff-addons = inputs.ff-addons.packages.${pkgs.system};
  inherit (inputs.ff-addons.lib.${pkgs.system}) buildFirefoxXpiAddon;
};
profile = import ./profile-main.nix { inherit pkgs ff-addons; };
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
