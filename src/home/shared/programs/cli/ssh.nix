{ osConfig, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        IdentityFile = "~/.ssh/id_ed25519";
      };

      "azure-monolith" = {
        hostname = "102.133.226.246";
        user = "kira";
        identityFile = osConfig.age.secrets.azure-monolith-key.path;
      };
    };
  };
}
