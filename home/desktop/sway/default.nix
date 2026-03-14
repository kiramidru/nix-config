{ pkgs, ... }:

{
  imports = [
    ./bindings.nix
    ./input.nix
    ./rules.nix
    ./services.nix
    ./output.nix
    ./scripts.nix
    ./startup.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    config = {
      terminal = "${pkgs.foot}/bin/foot";
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      bars = [ ];

      # Gaps
      gaps = {
        inner = 4;
        outer = 4;
        smartGaps = false;
      };

      window = {
        border = 0;
        titlebar = false;
      };

      seat = {
        "seat0" = {
          xcursor_theme = "Bibata-Original-Ice 24";
        };
      };
    };

    extraConfig = ''
      corner_radius 10

      blur_passes 3
      blur_radius 7

      shadows enable
      shadow_blur_radius 15
      shadow_color #000000FF

      default_dim_inactive 0.2
    '';
  };

  home.packages = with pkgs; [
    lxqt.lxqt-policykit
    brightnessctl
    cava
    grim
    jq
    mpv
    nautilus
    playerctl
    swaylock
    tuigreet
    wlogout
    wlsunset
  ];
}
