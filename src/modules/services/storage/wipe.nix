{ pkgs, ... }:
{
  boot.initrd.systemd.services.restore-root = {
    description = "Restore root subvolume";
    wantedBy = [ "initrd.target" ];
    after = [ "initrd-root-device.target" ];
    before = [ "sysroot.mount" ];
    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";

    script = ''
      mkdir -p /mnt
      mount -o subvol=/ /dev/disk/by-label/nixos /mnt
      if [ -e /mnt/@ ]; then
          btrfs subvolume delete /mnt/@
      fi
      btrfs subvolume create /mnt/@

      umount /mnt
    '';
  };

  fileSystems."/persist".neededForBoot = true;
}
