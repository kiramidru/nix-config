{ osConfig, pkgs, ... }:
{
  home.packages = [ pkgs.mosh ];
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        IdentityFile = "~/.ssh/id_ed25519";
      };

      "azure-monolith-vm" = {
        hostname = "158.158.73.144";
        user = "kira";
        identityFile = osConfig.age.secrets.azure-monolith-vm-key.path;
      };
    };
  };
}
