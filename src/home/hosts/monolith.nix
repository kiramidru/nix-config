{ src, ... }:
{
  imports = [
    src.home.theme
    src.home.desktop.font
    src.home.desktop.notifications
    src.home.desktop.waybar
    src.home.desktop.sway.default
    src.home.shared.editors.neovim.default
  ]
  ++ (builtins.attrValues src.home.desktop.apps)
  ++ (builtins.attrValues src.home.shared.programs)
  ++ (builtins.attrValues src.home.shared.shell);

  home.username = "kira";
  home.homeDirectory = "/home/kira";
  home.stateVersion = "25.11";
}
