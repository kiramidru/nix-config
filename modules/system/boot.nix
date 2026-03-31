{ config, ... }:
{
  boot = {
    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    loader.efi.canTouchEfiVariables = true;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    tmp.cleanOnBoot = true;
  };

  age.secrets.sb-db-key.file = ../../secrets/sb-db-key.age;
  age.secrets.sb-db-cert.file = ../../secrets/sb-db-cert.age;

  systemd.tmpfiles.rules = [
    "d /etc/secureboot 0755 root root -"
    "d /etc/secureboot/keys 0755 root root -"
    "d /etc/secureboot/keys/db 0755 root root -"
    "L+ /etc/secureboot/keys/db/db.key - - - - ${config.age.secrets.sb-db-key.path}"
    "L+ /etc/secureboot/keys/db/db.pem - - - - ${config.age.secrets.sb-db-cert.path}"
  ];
}
