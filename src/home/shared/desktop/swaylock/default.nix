{ config, ... }:
let
  swaylock = "${config.programs.swaylock.package}/bin/swaylock -f";
  swaymsg = "${config.wayland.windowManager.sway.package}/bin/swaymsg";
in
{
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      show-failed-attempts = true;
      indicator-caps-lock = true;
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = swaylock;
      }
      {
        timeout = 600;
        command = "${swaymsg} 'output * power off'";
        resumeCommand = "${swaymsg} 'output * power on'";
      }
    ];
    events = {
      before-sleep = swaylock;
      lock = swaylock;
    };
  };
}
