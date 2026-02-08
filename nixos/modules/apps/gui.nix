{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blender
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
