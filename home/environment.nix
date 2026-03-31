{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "Bibata-Original-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };
}
