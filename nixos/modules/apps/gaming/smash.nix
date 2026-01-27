{
  inputs.ssbm.url = "github:djanatyn/ssbm-nix";
  outputs =
    {
      self,
      nixpkgs,
      ssbm,
    }:
    {
      nixosConfigurations.my-pc = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ssbm.nixosModules.default
          {
            programs.ssbm.enable = true;
            programs.ssbm.gcc.oc-kmod.enable = true;
          }
        ];
      };
    };
}
