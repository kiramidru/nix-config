{
  pkgs,
  config,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    overlays.enable = false;

    cursor = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        terminal = 10;
        applications = 11;
        desktop = 10;
        popups = 10;
      };
    };
  };
  home.pointerCursor.enable = true;

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  xdg.configFile."uwsm/env".source =
    "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
}
