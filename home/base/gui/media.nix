{ pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    qbittorrent
    mpv
  ];
}
