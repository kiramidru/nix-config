{
  description = "A shitshow I call my setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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
            { nixpkgs.hostPlatform = "x86_64-linux"; }
            ./hosts/monolith
            agenix.nixosModules.default
            nixvim.nixosModules.nixvim
            spicetify-nix.nixosModules.default
          ];
        };
      };
    };
}
