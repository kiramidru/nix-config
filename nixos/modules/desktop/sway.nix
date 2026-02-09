{ pkgs, ... }:
{
  services.xserver.enable = false;
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  services.seatd.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd sway";
        user = "kira";
      };
    };
  };
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
    brightnessctl
    cava
    eww
    grim
    jq
    mpv
    nautilus
    playerctl
    rofi
    swaylock
    tuigreet
    wlogout
    wlsunset
  ];
}
