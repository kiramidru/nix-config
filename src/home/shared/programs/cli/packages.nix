{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    pulsemixer
    pavucontrol
    impala
    bluetui
    grim
    slurp
    wlsunset
    wl-clipboard

    fastfetch
    ripgrep
  ];
}
