{ ... }:
{
  imports = [
    ./docker.nix
    ./fail2ban.nix
    ./scheduling.nix
    ./ssh.nix
    ./tailscale.nix
    ./wireguard.nix
  ];
}
