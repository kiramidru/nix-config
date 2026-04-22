{
  config,
  inputs,
  ...
}:
{
  age.secrets.proton-vpn-key.file = inputs.self + "/secrets/proton-vpn-key.age";

  networking.wg-quick.interfaces.wg0 = {
    address = [ "10.2.0.2/32" ];
    dns = [ "10.2.0.1" ];
    privateKeyFile = config.age.secrets.proton-vpn-key.path;
    mtu = 1280;

    peers = [
      {
        publicKey = "2v1DSq+q5x9o7PMVUjJ6hSrBD4lfjevMp45E/1mgF2I=";
        allowedIPs = [
          "0.0.0.0/0"
          "::/0"
        ];
        endpoint = "151.243.141.161:443";
        persistentKeepalive = 25;
      }
    ];
  };
}
