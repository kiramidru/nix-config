{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
  };

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "kvantum";
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Original-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
