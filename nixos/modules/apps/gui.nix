{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blender
    evillimiter
    godot
    inkscape
    lmstudio
    planify
    postman
    qbittorrent
    telegram-desktop
    obsidian
    zotero
  ];
}
