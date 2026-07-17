{ lib, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.tuigreet ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  programs.sway = {
    enable = true;
    package = lib.mkForce null;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "SwayFX";
        comment = "SwayFX managed by UWSM";
        binPath = "${pkgs.swayfx}/bin/sway";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd 'uwsm start sway-uwsm.desktop'";
        user = "greeter";
      };
    };
  };
}
