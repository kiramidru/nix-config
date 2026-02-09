{ ... }:
{
  virtualisation.docker.enable = true;
  users.users.kira.extraGroups = [ "docker" ];
}
