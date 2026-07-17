{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      jetbrains-mono
      iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "Iosevka"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK JP"
        ];
        serif = [
          "Noto Serif"
          "Noto Serif CJK JP"
        ];
      };
    };
  };
}
