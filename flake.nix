{
  description = "My nix environment";
  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixos-hardware.url = "github:NixOS/nixos-hardware";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      ff-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      ff-addons.inputs.nixpkgs.follows = "nixpkgs";
      hyprland.url = "github:hyprwm/Hyprland";
    };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.arsenal = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./system/arsenal.nix];
    };
    devShell = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      shell = with pkgs; mkShell {
        buildInputs = [nil nixpkgs-fmt];
      };
      in { ${system} = shell; };
  };
}
