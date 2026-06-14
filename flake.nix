{
  description = "A shitshow I call my setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: Use for wallpaper management
    wallpapers = {
      url = "github:kiramidru/nix-wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    warehouse-nix = {
      url = "github:kiramidru/warehouse-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      agenix,
      disko,
      haumea,
      ...
    }@inputs:
    let
      src = haumea.lib.load {
        src = ./src;
        loader = _: path: path;
      };
    in
    {
      nixosConfigurations = {
        monolith = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs src; };

          modules = [
            { nixpkgs.hostPlatform = "x86_64-linux"; }
            src.hosts.monolith.configuration

            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            disko.nixosModules.default
          ]
          ++ (builtins.attrValues src.modules.core);
        };
      };
    };
}
