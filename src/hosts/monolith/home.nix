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
        src.home.hosts.monolith
      ];

      age.secrets.github-token.file = inputs.self + "/secrets/github-token.age";
    };
  };
}
