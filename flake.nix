{
  description = "A shitshow I call my setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # TODO: HANDLE MULTIHOST CONFIG
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

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

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.agenix.inputs.nixpkgs.follows = "nixpkgs";
      inputs.agenix.inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    warehouse-nix = {
      url = "github:kiramidru/warehouse-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    wallpapers = {
      url = "github:kiramidru/wallpapers";
      flake = false;
    };

    secrets-nix = {
      url = "git+ssh://git@github.com/kiramidru/secrets-nix.git";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      haumea,
      agenix,
      disko,
      impermanence,
      secrets-nix,
      wallpapers,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;

      baseSrc = haumea.lib.load {
        src = ./src;
        loader = _: path: path;
      };

      pathing = import ./src/lib/pathing.nix { inherit lib; };
      catPrune = import ./src/lib/cat-prune.nix { inherit lib; };

      src = lib.recursiveUpdate baseSrc {
        lib = lib.recursiveUpdate pathing catPrune;
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
            impermanence.nixosModules.default

            {
              _module.args.secrets-nix = secrets-nix;
            }
          ]
          ++ (builtins.attrValues src.modules.core);
        };
      };
    };
}
