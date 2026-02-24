{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/apps
    ../../modules/core
    ../../modules/desktop
    ../../modules/dev
    ../../modules/editor
    ../../modules/hardware
    ../../modules/services
    ../../modules/shell
    ../../modules/system
  ];

  hostSpec = {
    username = "kira";
    hostName = "monolith";
    role = "laptop";
  };

  networking.hostName = config.hostSpec.hostName;
  system.stateVersion = "24.11";
}
