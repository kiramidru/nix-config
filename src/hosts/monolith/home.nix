{
  inputs,
  config,
  src,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs src;
      inherit (config) hostSpec;
    };

    backupFileExtension = "hm-backup";

    users."${config.hostSpec.username}" = {
      imports = [
        inputs.agenix.homeManagerModules.default
        inputs.spicetify-nix.homeManagerModules.default
        inputs.nixvim.homeModules.nixvim

        src.home.users.${config.hostSpec.username}
      ];
    };
  };
}
