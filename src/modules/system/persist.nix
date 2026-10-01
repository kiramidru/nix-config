_: {
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/iwd"
      "/var/lib/tailscale"
      "/var/lib/bluetooth"
      "/var/lib/systemd/timers"
      "/var/lib/systemd/backlight"
      "/var/lib/chrony"
      "/var/lib/fail2ban"
      "/var/lib/fwupd"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
  systemd.services.systemd-machine-id-commit.enable = false;
  fileSystems."/persist".neededForBoot = true;
}
