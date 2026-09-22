{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
    netflix
    vlc
    sioyek
    telegram-desktop
    qbittorrent
    discord
    slack
    zoom-us
  ];
}
