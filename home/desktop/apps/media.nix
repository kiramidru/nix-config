{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
    sioyek
    telegram-desktop
    qbittorrent
    vesktop
  ];
}
