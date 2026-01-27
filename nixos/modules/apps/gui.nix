{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blender
    discord
    foliate
    gimp
    godot
    onlyoffice-desktopeditors
    planify
    spotify
    telegram-desktop
    obsidian
    zotero
  ];
}
