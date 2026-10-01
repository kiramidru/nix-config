{
  src,
  config,
  hostSpec,
  ...
}:
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

  home = {
    inherit (hostSpec) username;
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "26.11";
  };
}
