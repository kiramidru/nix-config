{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    package = pkgs.swayfx;

    extraConfig = ''
      corner_radius 10

      blur enable
      blur_xray disable

      blur_radius 7
      blur_passes 4

      shadows enable
      shadows_on_csd disable

      shadow_blur_radius 15
      shadow_color #0000007F

      default_dim_inactive 0.25
      dim_inactive_colors.unfocused #000000BF
    '';
  };
}
