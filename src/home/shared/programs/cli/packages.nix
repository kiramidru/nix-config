{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    impala
    grim
    slurp
    wlsunset
    wlogout

    fastfetch
    ripgrep
    gh
  ];
}
