{ lib, ... }:
{
  networking.useDHCP = lib.mkDefault true;
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    8080
    22 # SSH
  ];
  networking.firewall.allowedUDPPorts = [ ];
}
