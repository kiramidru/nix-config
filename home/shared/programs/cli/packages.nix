{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    fastfetch
    fd
    ripgrep
    tldr
    xh
  ];
}
