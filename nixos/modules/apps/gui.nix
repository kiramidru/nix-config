{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blender
    discord
    easyeffects
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
