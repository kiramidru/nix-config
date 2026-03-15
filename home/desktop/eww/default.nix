{ ... }:
{
  programs.eww = {
    enable = true;
    enableFishIntegration = true;
    configDir = ./config;
  };

  xdg.configFile."eww" = {
    source = ./config;
    recursive = true;
  };
}
