{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kiro
  ];
}
