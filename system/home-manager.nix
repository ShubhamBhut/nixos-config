{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ]; 
  home.packages = [ (pkgs.callPackages ../kailorston/thunderbird-daily.nix {}) ];
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
