{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bluetui
    brightnessctl
    playerctl
    fastfetch
    fd
    ripgrep
    xh
  ];
}
