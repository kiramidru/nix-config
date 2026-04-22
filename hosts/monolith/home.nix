{
  inputs,
  config,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "hm-backup";

    extraSpecialArgs = {
      inherit inputs;
      inherit (config) hostSpec;
    };

    users."${config.hostSpec.username}" = {
      imports = [
        inputs.agenix.homeManagerModules.default
        "${inputs.self}/home"
      ];

      age.secrets.github-token.file = inputs.self + "/secrets/github-token.age";

      home = {
        inherit (config.hostSpec) username;
        homeDirectory = "/home/${config.hostSpec.username}";
        stateVersion = "25.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
