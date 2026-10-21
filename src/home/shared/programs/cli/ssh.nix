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

      "monolith-vm" = {
        hostname = "20.219.58.158";
        user = "kira";
        identityFile = osConfig.age.secrets.azure-monolith-vm-key.path;
      };

      "gaming-vm" = {
        hostname = "68.221.160.49";
        user = "kira";
        identityFile = osConfig.age.secrets.gaming-vm-key.path;
      };
    };
  };
}
