{ inputs, pkgs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

   home-manager.users.kailorston = {
    home.stateVersion = "22.11";
    imports = [
      ./dev.nix
      ./git.nix
      ./nvim
      ./hyprland
      ./hyprland/neofetch
      ./shell
      ./vscode.nix
      ./hyprland/waybar
      ./browser
      ./others.nix
      ./pentesting
      ./keepassxc.nix
    ];
    # home.packages = [ (pkgs.callPackage ./thunderbird-daily.nix {}) ];
    home.packages = [ (pkgs.callPackage ./magit {}) pkgs.thunderbird ];

  };
 
}
