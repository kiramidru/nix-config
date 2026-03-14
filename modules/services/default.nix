{ ... }:
{
  imports = [
    ./docker.nix
    ./scheduling.nix
    ./ssh.nix
    ./tailscale.nix
  ];
}
