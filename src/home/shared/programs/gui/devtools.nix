{ pkgs, ... }:
{
  home.packages = with pkgs; [
    opencode
    postman
  ];
}
