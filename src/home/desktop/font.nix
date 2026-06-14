{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains-mono
    iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.enable = true;
}
