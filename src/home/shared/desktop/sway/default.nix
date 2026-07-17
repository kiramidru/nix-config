{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    checkConfig = false;

    config = {
      terminal = "${pkgs.foot}/bin/foot";
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      bars = [ ];

      gaps = {
        inner = 4;
        outer = 4;
        smartGaps = false;
      };

      window = {
        border = 0;
        titlebar = false;
      };
    };
  };

  home.packages = with pkgs; [
    impala
    grim
    slurp
    wlsunset
    wlogout
  ];
}
