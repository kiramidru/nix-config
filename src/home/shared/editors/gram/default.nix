{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gram
  ];
}
