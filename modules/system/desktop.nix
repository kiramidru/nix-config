{ pkgs, ... }:
{
  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    config.common.default = "*";
  };

  programs.sway.enable = true;
  programs.uwsm.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd 'uwsm start sway'";
        user = "greeter";
      };
    };
  };
}
