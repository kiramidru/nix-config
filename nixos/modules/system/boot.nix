{ pkgs, ... }:
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
      "splash"
      "loglevel=3"
      "vt.global_cursor_default=0"
    ];

    plymouth = {
      enable = true;
      themePackages = [ (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "pixels" ]; }) ];
      theme = "pixels";
    };

    consoleLogLevel = 0;
  };
}
