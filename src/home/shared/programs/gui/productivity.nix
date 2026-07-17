{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunderbird
    obsidian
    zotero
    planify
  ];
}
