{ lib, config, ... }:
{
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  systemd.services.NetworkManager-wait-online.enable = false;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      8080
      22 # SSH
    ];
    allowedUDPPorts = [ ];
    checkReversePath = "loose";
  };

  networking.hostName = lib.mkDefault config.hostSpec.hostName;
}
