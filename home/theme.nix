{ inputs, pkgs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  dconf.enable = true;
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
  };

  gtk = {
    enable = true;
    gtk4.theme = null;
    theme.name = "catppuccin-mocha-sapphire-standard";

    cursorTheme = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Original-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
