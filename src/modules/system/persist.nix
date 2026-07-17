{ ... }: {
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/iwd"
      "/var/lib/tailscale"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
  systemd.services.systemd-machine-id-commit.enable = false;
  fileSystems."/persist".neededForBoot = true;
}
