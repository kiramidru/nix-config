_: {
  boot.initrd.systemd.services.restore-root = {
    description = "Reset Btrfs root and create a fresh one";
    wantedBy = [ "initrd.target" ];
    requires = [ "dev-disk-by\\x2dpartlabel-disk\\x2dmain\\x2droot.device" ];
    after = [
      "dev-disk-by\\x2dpartlabel-disk\\x2dmain\\x2droot.device"
      "initrd-root-device.target"
    ];
    before = [ "sysroot.mount" ];

    unitConfig.DefaultDependencies = false;
    serviceConfig.Type = "oneshot";

    script = ''
      set -euo pipefail

      mkdir -p /mnt
      mount -o subvol=/ /dev/disk/by-partlabel/disk-main-root /mnt
      trap 'umount /mnt || true' EXIT

      if [ -e /mnt/@ ]; then
        echo "Deleting old root subvolume (@)..."
        btrfs subvolume delete --recursive /mnt/@
      fi

      echo "Creating fresh root subvolume (@)..."
      btrfs subvolume create /mnt/@
    '';
  };
}
