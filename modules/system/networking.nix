{ ... }:
{
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  systemd.services.NetworkManager-wait-online.enable = false;

  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    8080
    22 # SSH
  ];
  networking.firewall.allowedUDPPorts = [ ];
}
