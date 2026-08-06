{ src, config, ... }:
{
  imports = [
    src.home.shared.persist
    src.home.shared.theme
  ]
  ++ src.lib.flatten [
    src.home.shared.desktop
    src.home.shared.editors
    src.home.shared.programs
    src.home.shared.shell
  ];

  home.username = "kira";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "26.11";
}
