{ ... }:
{
  boot.initrd.systemd.services.restore-root = {
    description = "Wipe and Recreate Btrfs Root";
    wantedBy = [ "initrd.target" ];
    after = [ "initrd-root-device.target" ];
    before = [ "sysroot.mount" ];

    unitConfig.DefaultDependencies = false;
    serviceConfig.Type = "oneshot";

    script = ''
      mkdir -p /mnt
      # Mount the top-level subvolume
      mount -o subvol=/ /dev/disk/by-uuid/19cd7a60-2fcc-42e9-a5f6-2aed68d82fe8 /mnt

      if [ -e /mnt/@ ]; then
          echo "Scanning for nested subvolumes..."
          # Find any nested subvolumes (like /var/lib/machines) and delete them
          btrfs subvolume list -o /mnt/@ | cut -f9 -d' ' | while read -r subvolume; do
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
