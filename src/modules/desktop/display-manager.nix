{ lib, pkgs, ... }:
{
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

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    swaylock = { };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --user kira --cmd 'uwsm start sway-uwsm.desktop'";
        user = "greeter";
      };
    };
  };
}
