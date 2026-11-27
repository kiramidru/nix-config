_: {
  services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "enp3s0";
      WIFI_IFACE = "wlan0";
      SSID = "Wu-Tang LAN";
      PASSPHRASE = "kiramidru";
    };
  };

  systemd.services.create_ap.wantedBy = [ ];
}
