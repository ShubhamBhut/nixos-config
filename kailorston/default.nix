{ inputs, pkgs, lib, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

   home-manager.users.kailorston = {
    home.stateVersion = "22.11";
    imports = [
      ./browser
      ./dev
      ./hyprland
      ./hyprland/waybar
      ./hyprland/neofetch
      ./nvim
      ./pentesting
      ./shell
      ./git.nix
      ./keepassxc.nix
      ./others.nix
      ./vscode.nix
    ];
    # home.packages = [ (pkgs.callPackage ./thunderbird-daily.nix {}) ];
    home.packages = [ (pkgs.callPackage ./magit {}) pkgs.thunderbird ];
    manual.html.enable = false;

  };
 
}
