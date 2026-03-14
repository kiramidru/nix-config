{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Creativity & Design
    blender
    godot_4
    inkscape

    # Productivity & Notes
    obsidian
    zotero
    planify

    # Development & Tools
    postman
    lmstudio

    # Communication & Media
    telegram-desktop
    qbittorrent
  ];
}
