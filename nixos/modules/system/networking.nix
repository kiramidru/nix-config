{ lib, ... }:
{
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
  environment.systemPackages = [
    #pkgs.impala
  ];

  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [
    41641 # Tailscale
  ];
}
