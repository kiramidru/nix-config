_: {
  boot.initrd.systemd.services.restore-root = {
    description = "Archive old Btrfs root and create a fresh one";
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
      mkdir -p /mnt
      mount -o subvol=/ /dev/disk/by-partlabel/disk-main-root /mnt

        if [ -e /mnt/@ ]; then
          echo "Scanning for nested subvolumes..."

            btrfs subvolume list -o /mnt/@ | cut -f9 -d' ' | sort -r | while read -r subvolume; do
              echo "Deleting nested subvolume: /$subvolume"
              btrfs subvolume delete "/mnt/$subvolume"
          done

          echo "Deleting main root subvolume (@)..."
          btrfs subvolume delete /mnt/@
        fi

      echo "Creating fresh root subvolume (@)..."
      btrfs subvolume create /mnt/@

      umount /mnt
    '';
  };
}
