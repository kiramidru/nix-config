{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    impala
    grim
    slurp
    wlsunset

    fastfetch
    ripgrep
    gh
  ];
}
