{ pkgs, ... }:
{
  wayland.windowManager.sway.config.startup = [
    { command = "${pkgs.eww}/bin/eww daemon && ${pkgs.eww}/bin/eww open-many bar notch"; }
  ];
}
