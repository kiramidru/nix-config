{ pkgs, ... }:
{
  home.packages = with pkgs; [
    netflix
    vlc
    telegram-desktop
    qbittorrent
    discord
    slack
    zoom-us
  ];
}
