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
        hostname = "20.219.58.158";
        user = "kira";
        identityFile = osConfig.age.secrets.azure-monolith-vm-key.path;
      };

      "minecraft-vm" = {
        hostname = "68.221.171.186";
        user = "kira";
        identityFile = osConfig.age.secrets.minecraft-vm-key.path;
      };
    };
  };
}
