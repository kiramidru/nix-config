{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blender
    discord
    easyeffects
    evillimiter
    fontforge-gtk
    foliate
    godot
    inkscape
    lmstudio
    onlyoffice-desktopeditors
    planify
    postman
    qbittorrent
    telegram-desktop
    obsidian
    zotero
  ];
}
