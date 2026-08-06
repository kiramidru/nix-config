{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
    vlc
    sioyek
    telegram-desktop
    qbittorrent
    vesktop
  ];
}
