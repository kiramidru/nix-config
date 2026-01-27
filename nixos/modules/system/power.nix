{ lib, config, ... }:
lib.mkIf (config.hostSpec.role == "laptop") {
  powerManagement.powertop.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      AMD_PSTATE_EPP_ON_BAT = "power";

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;

      PCIE_ASPM_ON_BAT = "powersave";
      SATA_LINKPWR_ON_BAT = "min_power";
      USB_AUTOSUSPEND = 1;

      SOUND_POWER_SAVE_ON_BAT = 1;
    };
  };

  boot.kernelParams = [
    "amd_pstate=active"
    "pcie_aspm=force"
    "amdgpu.runpm=1"
    "amdgpu.dcfeaturemask=0x9"
    "acpi_backlight=native"
    "amdgpu.backlight=0"
    "mem_sleep_default=deep"
    "processor.max_cstate=5"
    "nvme_core.default_ps_max_latency_us=0"
  ];

  boot.blacklistedKernelModules = [
    "nvidia"
    "nouveau"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
    "snd_hda_codec_hdmi"
  ];

  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';

  services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="pci", ATTR{power/control}="auto"

      ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"

      ACTION=="add", SUBSYSTEM=="scsi_host", KERNEL=="host*", ATTR{link_power_management_policy}="min_power"

    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{power/control}="auto"

    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto"

    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="8087", ATTR{authorized}="0"
  '';

  services.journald.extraConfig = ''
    Storage=volatile
    RuntimeMaxUse=32M
  '';

  boot.kernel.sysctl = {
    "vm.swappiness" = 100;
    "vm.dirty_writeback_centisecs" = 6000;
    "kernel.nmi_watchdog" = 0;
  };

  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 25;
  };
}
