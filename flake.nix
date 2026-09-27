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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    zeroclaw = {
      url = "github:zeroclaw-labs/zeroclaw";
      inputs.nixpkgs.follows = "nixpkgs";
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
    {
      nixpkgs,
      home-manager,
      haumea,
      agenix,
      disko,
      impermanence,
      pre-commit-hooks,
      secrets-nix,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      preCommitCheck = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          nixfmt.enable = true;
          end-of-file-fixer.enable = true;
          trim-trailing-whitespace.enable = true;
          check-merge-conflicts.enable = true;
          deadnix.enable = true;
          statix.enable = true;
        };
      };

      baseSrc = haumea.lib.load {
        src = ./src;
        loader = _: path: path;
      };

      pathing = import ./src/lib/pathing.nix { inherit lib; };

      src = lib.recursiveUpdate baseSrc {
        lib = pathing;
      };
    in
    {
      checks.${system}.pre-commit-check = preCommitCheck;

      devShells.${system}.default = pkgs.mkShell {
        inherit (preCommitCheck) shellHook;
        buildInputs = preCommitCheck.enabledPackages;
      };

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
