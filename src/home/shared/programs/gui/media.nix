{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    mpv
    vlc
    sioyek
    telegram-desktop
    whatsapp-electron
    qbittorrent
    vesktop
  ];
}
