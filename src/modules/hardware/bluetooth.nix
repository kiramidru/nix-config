{ lib, config, ... }:
lib.mkIf (config.hostSpec.role != "server") {
  hardware.bluetooth = {
    enable = false;
    settings = {
      General = {
        Experimental = true;
        KernelExperimental = true;
      };
    };
  };

  boot.kernelModules = [ "bluetooth" ];
  boot.extraModprobeConfig = ''
    options bluetooth enable_iso=1
  '';
}
