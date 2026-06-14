{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    mpv
    sioyek
    telegram-desktop
    qbittorrent
    vesktop
  ];
}
