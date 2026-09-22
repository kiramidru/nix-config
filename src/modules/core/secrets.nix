{ inputs, ... }:
{
  age.identityPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets = {
    root-password = {
      file = "${inputs.secrets-nix}/root-password.age";
      owner = "root";
      mode = "0400";
    };
    kira-password = {
      file = "${inputs.secrets-nix}/kira-password.age";
      owner = "kira";
      mode = "0400";
    };
    restic-password = {
      file = "${inputs.secrets-nix}/restic-password.age";
      owner = "kira";
      mode = "0400";
    };
    backblaze-bucket = {
      file = "${inputs.secrets-nix}/backblaze-bucket.age";
      owner = "kira";
      mode = "0400";
    };
    github-token = {
      file = "${inputs.secrets-nix}/github-token.age";
      owner = "kira";
      mode = "0400";
    };
    vpn-credential = {
      file = "${inputs.secrets-nix}/vpn-credential.age";
      owner = "kira";
      mode = "0400";
    };
    deepseek-key = {
      file = "${inputs.secrets-nix}/deepseek-key.age";
      owner = "kira";
      mode = "0400";
    };
    hcnsec-key = {
      file = "${inputs.secrets-nix}/hcnsec-key.age";
      owner = "kira";
      mode = "0400";
    };
    azure-monolith-vm-key = {
      file = "${inputs.secrets-nix}/azure-monolith-vm-key.age";
      owner = "kira";
      mode = "0400";
    };
    minecraft-vm-key = {
      file = "${inputs.secrets-nix}/minecraft-vm-key.age";
      owner = "kira";
      mode = "0400";
    };
  };
}
