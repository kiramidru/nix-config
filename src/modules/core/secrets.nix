{ inputs, config, ... }:
let
  inherit (config.hostSpec) username;

  mkSecret = name: owner: {
    file = "${inputs.secrets-nix}/${name}.age";
    inherit owner;
    mode = "0400";
  };
in
{
  age.identityPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets = {
    root-password = mkSecret "root-password" "root";
    user-password = mkSecret "${username}-password" "root";
    restic-password = mkSecret "restic-password" "root";
    backblaze-bucket = mkSecret "backblaze-bucket" "root";
    github-token = mkSecret "github-token" username;
    vpn-credential = mkSecret "vpn-credential" username;
    deepseek-key = mkSecret "deepseek-key" username;
    hcnsec-key = mkSecret "hcnsec-key" username;
    azure-monolith-vm-key = mkSecret "azure-monolith-vm-key" username;
    minecraft-vm-key = mkSecret "minecraft-vm-key" username;
  };
}
