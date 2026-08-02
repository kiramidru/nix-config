{ config, ... }:
{

  networking.wg-quick.interfaces = {
    proton = {
      address = [ "10.2.0.2/32" ];
      privateKeyFile = config.age.secrets.vpn-credential.path;
      autostart = false;

      peers = [
        {
          publicKey = "gucaLaM/mgJQbHVvnZNtW+1L4Mi7E2mtTMrhS0K4miU=";
          endpoint = "146.70.230.146:51820";
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];

          persistentKeepalive = 25;
        }
      ];
    };
  };
}
