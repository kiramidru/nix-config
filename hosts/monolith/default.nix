{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./home.nix
    ./disko-config.nix
    ../../modules
  ];

  hostSpec = {
    username = "kira";
    hostName = "monolith";
    role = "laptop";
  };

  networking.hostName = config.hostSpec.hostName;
  system.stateVersion = "24.11";
}
