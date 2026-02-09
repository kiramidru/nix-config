{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blender
    discord
    easyeffects
    foliate
    gimp
    godot
    onlyoffice-desktopeditors
    planify
    postman
    telegram-desktop
    obsidian
    zotero
  ];
}
