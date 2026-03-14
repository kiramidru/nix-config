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
        inputs.nixvim.homeModules.nixvim
        inputs.stylix.homeModules.stylix
        inputs.agenix.homeManagerModules.default
        ../../home
      ];

      age.secrets.github-token = {
        file = ../../secrets/github-token.age;
      };

      home = {
        inherit (config.hostSpec) username;
        homeDirectory = "/home/${config.hostSpec.username}";
        stateVersion = "24.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
