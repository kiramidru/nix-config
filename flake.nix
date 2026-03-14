{
  description = "A shitshow I call my setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      agenix,
      nixvim,
      spicetify-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        monolith = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.hostPlatform = "x86_64-linux";
              nixpkgs.overlays = [ (import ./overlays) ];
            }
            ./hosts/monolith
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            spicetify-nix.nixosModules.default
          ];
        };
      };
    };
}
