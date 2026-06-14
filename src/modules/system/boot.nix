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

      "acpi.debug_layer=0"
      "acpi.debug_level=0"

      "8250.nr_uarts=0"
    ];

    consoleLogLevel = 0;

    blacklistedKernelModules = [
      "ledtrig_audio"
      "serial8250"
    ];
  };
}
