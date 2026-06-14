{ src, ... }:
{
  imports = [
    src.hosts.monolith.hardware
    src.hosts.monolith.home
    src.hosts.monolith.disko-config
  ]
  ++ (builtins.attrValues src.modules.system);

  hostSpec = {
    username = "kira";
    hostName = "monolith";
    role = "laptop";
  };

  system.stateVersion = "25.11";
}
