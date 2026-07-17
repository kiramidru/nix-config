{ src, ... }:
{
  imports = [
    src.hosts.monolith.hardware
    src.hosts.monolith.home
    src.hosts.monolith.disko-config
  ]
  ++ src.lib.flatten src.modules;

  hostSpec = {
    username = "kira";
    hostName = "monolith";
    role = "laptop";
  };

  system.stateVersion = "26.11";
}
