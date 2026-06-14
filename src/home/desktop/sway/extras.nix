{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    package = pkgs.swayfx;

    extraConfig = ''
      corner_radius 10
    '';
  };
}
