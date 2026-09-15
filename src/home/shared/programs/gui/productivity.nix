{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunderbird
    trilium-desktop
    obsidian
    zotero
  ];
}
