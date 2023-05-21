{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

   home-manager.users.kailorston = {
    home.stateVersion = "22.11";
    imports = [
      ./dev.nix
      ./git.nix
      ./emacs
      ./nvim
      ./hyprland
    ];
  };
 
}


