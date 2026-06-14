{ lib, config, ... }:
{
  networking.wireless.iwd = {
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

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22 # SSH
    ];
    allowedUDPPorts = [
      24642 # Stardew Valley
    ];

    checkReversePath = "loose";
  };

  networking.useDHCP = false;
  # networking.interfaces.enp3s0.useDHCP = true;

  networking.resolvconf.enable = true;
  networking.nameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];

  networking.hostName = lib.mkDefault config.hostSpec.hostName;
}
