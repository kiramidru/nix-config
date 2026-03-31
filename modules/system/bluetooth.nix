{ lib, config, ... }:
lib.mkIf (config.hostSpec.role != "server") {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
