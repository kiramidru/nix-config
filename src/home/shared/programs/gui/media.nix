{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
    telegram-desktop
    qbittorrent
    discord
    slack
    zoom-us
  ];
}
