{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar
    thunar-archive-plugin
    thunar-volman
    thunar-media-tags-plugin
  ];
}
