{ pkgs, ... }:
{
  virtualisation.docker.enable = true;
  users.users.kira.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
