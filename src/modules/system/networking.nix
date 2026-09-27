{ lib, config, ... }:
{
  networking = {
    wireless.iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration = true;
          NameResolvingService = "resolvconf";
        };
        Network = {
          EnableIPv6 = true;
          RoutePriorityOffset = 100;
        };
      };
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        8081 # Expo
      ];
      allowedUDPPorts = [
      ];

      checkReversePath = "loose";
    };

    useDHCP = false;
    # interfaces.enp3s0.useDHCP = true;

    resolvconf.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    hostName = lib.mkDefault config.hostSpec.hostName;
  };
}
