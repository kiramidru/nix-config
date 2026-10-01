{
  description = "A shitshow I call my setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";

    # TODO: HANDLE MULTIHOST CONFIG
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "";
    };

    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    warehouse-nix = {
      url = "github:kiramidru/warehouse-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    gaming-nix = {
      url = "github:kiramidru/gaming-nix";
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
    inputs@{
      flake-parts,
      nixpkgs,
      haumea,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [ inputs.pre-commit-hooks.flakeModule ];

      perSystem =
        { config, pkgs, ... }:
        {
          formatter = pkgs.nixfmt-tree;

          # Exposed as checks.<system>.pre-commit
          pre-commit.settings.hooks = {
            nixfmt.enable = true;
            end-of-file-fixer.enable = true;
            trim-trailing-whitespace.enable = true;
            check-merge-conflicts.enable = true;
            deadnix.enable = true;
            statix.enable = true;
          };

          devShells.default = pkgs.mkShell {
            inputsFrom = [ config.pre-commit.devShell ];
          };
        };

      flake =
        let
          inherit (nixpkgs) lib;

          baseSrc = haumea.lib.load {
            src = ./src;
            loader = _: path: path;
          };

          src = lib.recursiveUpdate baseSrc {
            lib = import ./src/lib/pathing.nix { inherit lib; };
          };

          mkHost =
            name:
            lib.nixosSystem {
              specialArgs = { inherit inputs src; };
              modules = [
                src.hosts.${name}.configuration

                inputs.home-manager.nixosModules.home-manager
                inputs.agenix.nixosModules.default
                inputs.disko.nixosModules.default
                inputs.impermanence.nixosModules.default
              ];
            };
        in
        {
          nixosConfigurations = lib.genAttrs [ "monolith" ] mkHost;
        };
    };
}
