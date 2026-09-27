{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    playerctl
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
