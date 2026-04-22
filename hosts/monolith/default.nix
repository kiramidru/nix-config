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

  system.stateVersion = "25.11";
}
