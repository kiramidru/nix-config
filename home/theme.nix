{ pkgs, ... }:
{
  home.packages = [ pkgs.dconf ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      serif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      sizes = {
        terminal = 10;
        applications = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;
    };

    opacity = {
      terminal = 0.75;
    };

    targets = {
      sway.enable = true;
      foot.enable = true;
      fish.enable = true;
      fuzzel.enable = true;
      mako.enable = true;
      spicetify.enable = true;
      yazi.enable = true;

      nixvim.enable = false;
      librewolf.enable = false;
    };
  };
}
