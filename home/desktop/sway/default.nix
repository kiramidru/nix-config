{ pkgs, ... }:

{
  imports = [
    ./bindings.nix
    ./input.nix
    ./output.nix
    ./rules.nix
    ./scripts.nix
    ./startup.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = null;
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
    grim
    slurp
    wlsunset
    wlogout
  ];
}
