{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    fastfetch
    ripgrep
    xh
  ];
}
