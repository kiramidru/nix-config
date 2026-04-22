{ pkgs, ... }:
{
  programs.eww = {
    enable = true;
    enableFishIntegration = true;
    configDir = ./config;
  };

  home.packages = with pkgs; [
    playerctl
    brightnessctl
    wireplumber
    impala
    bluetui
    jq
  ];
}
