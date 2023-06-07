{ inputs, lib, ... }: {
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
    extraOptions = ''
      flake-registry =
      http-connections = 0
    '';
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
  nixpkgs.config.allowUnfree = true;
  system.configurationRevision = with inputs; lib.mkIf (self ? rev) self.rev;
}
