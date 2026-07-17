{
  inputs,
  pkgs,
  config,
  src,
  ...
}:
{
  imports = [
    (src.lib.catppuccinPrune {
      src = inputs.catppuccin;
      ignoreList = [ "vscode.nix" ];
    })
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "sapphire";
  };

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "kvantum";
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Original-Classic";
    package = pkgs.bibata-cursors;
    gtk.enable = true;
    x11.enable = true;
    size = 24;
  };

  xdg.configFile."uwsm/env".source =
    "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
}
