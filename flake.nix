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
      nix-index-database.url = "github:Mic92/nix-index-database";
      nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
      hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      legacy-fox = { url = "github:girst/LegacyFox-mirror-of-git.gir.st"; flake = false; };
       rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
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
