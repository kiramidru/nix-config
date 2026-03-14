{ ... }:
{
  boot = {
    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "0";
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    tmp.cleanOnBoot = true;
    kernelParams = [
      "quiet"
      "loglevel=3"
      "vt.global_cursor_default=0"
      "tpm_tis.interrupts=0"
      "udev.log_level=3"
      "rd.systemd.show_status=false"

      "rd.udev.log_level=3"
    ];

    consoleLogLevel = 0;
  };
}
