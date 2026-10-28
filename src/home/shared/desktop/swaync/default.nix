{ config, pkgs, ... }:
{
  # GTK needs the symbolic icons for dismiss, playback and the empty state.
  home.packages = [ pkgs.adwaita-icon-theme ];

  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "overlay";
      layer-shell = true;
      cssPriority = "user";
      control-center-width = 420;
      notification-window-width = 400;

      timeout = 7;
      timeout-low = 4;
      timeout-critical = 0;

      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      notification-grouping = true;
      relative-timestamps = true;
      transition-time = 180;
      hide-on-clear = false;
      hide-on-action = true;
      text-empty = "All caught up";

      control-center-margin-top = 14;
      control-center-margin-bottom = 14;
      control-center-margin-right = 14;
      control-center-margin-left = 14;

      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-body-image-height = 160;
      notification-body-image-width = 320;

      widgets = [
        "title"
        "dnd"
        "volume"
        "mpris"
        "notifications"
        "buttons-grid"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear all";
        };
        dnd.text = "Do not disturb";
        volume = {
          label = "󰕾";
          show-per-app = true;
          show-per-app-icon = true;
          show-per-app-label = false;
          expand-per-app = false;
          expand-button-label = "󰅂";
          collapse-button-label = "󰅀";
          empty-list-label = "No apps playing audio";
          animation-duration = 180;
        };
        mpris = {
          autohide = true;
          show-album-art = "when-available";
        };
        notifications.vexpand = true;
        buttons-grid = {
          buttons-per-row = 3;
          actions = [
            {
              label = "󰕾  Sound";
              command = "${pkgs.swaynotificationcenter}/bin/swaync-client -cp; ${pkgs.pavucontrol}/bin/pavucontrol";
            }
            {
              label = "󰌾  Lock";
              command = "${pkgs.swaynotificationcenter}/bin/swaync-client -cp; ${config.programs.swaylock.package}/bin/swaylock -f";
            }
            {
              label = "󰐥  Power";
              command = "${pkgs.swaynotificationcenter}/bin/swaync-client -cp; ${config.programs.wlogout.package}/bin/wlogout";
            }
          ];
        };
      };
    };
  };
}
