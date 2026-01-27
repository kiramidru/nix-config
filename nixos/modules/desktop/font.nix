{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
  };
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
