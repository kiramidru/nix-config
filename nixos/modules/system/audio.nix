{ lib, config, ... }:
lib.mkIf (config.hostSpec.role != "server") {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
