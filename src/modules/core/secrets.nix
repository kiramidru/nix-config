{ inputs, ... }:

{
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets = {
    "root-password" = {
      file = "${inputs.secrets-nix}/root-password.age";
      owner = "root";
      mode = "0400";
    };
    "kira-password" = {
      file = "${inputs.secrets-nix}/kira-password.age";
      owner = "kira";
      mode = "0400";
    };
    "restic-password" = {
      file = "${inputs.secrets-nix}/restic-password.age";
      owner = "kira";
      mode = "0400";
    };
    "backblaze-bucket" = {
      file = "${inputs.secrets-nix}/backblaze-bucket.age";
      owner = "kira";
      mode = "0400";
    };
  };
}
