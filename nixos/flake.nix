{
  description = "A shitshow I call my setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      agenix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        monolith = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/monolith
            agenix.nixosModules.default
          ];
        };
        fragment = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/fragment ];
        };
      };
    };
}
