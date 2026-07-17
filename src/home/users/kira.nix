{ src, config, ... }:
{
  imports = src.lib.flatten [
    src.home.shared
  ];

  home.username = "kira";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "26.11";
}
