{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  services.swaync.style = ''
    * {
      all: unset;
      font-family: "JetBrainsMono Nerd Font Propo";
      font-size: 13px;
      font-weight: bold;
      color: ${color.base05};
    }

    .control-center {
      background-color: ${color.base00};
      border: 1px solid transparent;
      border-radius: 24px;
      margin: 18px;
      padding: 12px;
    }

    .notification-row .notification-background .notification {
      margin: 6px;
      padding: 8px 6px 2px 2px;
    }

    .notification-row .notification-background .close-button {
      background-color: ${color.base00};
      border-radius: 16px;
      margin: 0px;
      padding: 4px;
    }

    .floating-notifications.background .notification-row .notification-background .notification {
      background-color: transparent;
      border: 1px solid transparent;
    }

    .notification-content {
       padding: 16px 24px; 
    }

    .widget-title {
      background-color: ${color.base00};
      font-size: 16px;
      margin: 8px 6px 4px;
    }

    .widget-title button {
      background: ${color.base01};
      border: 1px solid ${color.base02};
      border-radius: 14px;
      color: ${color.base04};
      padding: 5px 10px;
    }

    .widget-title button:hover {
      background: ${color.base08};
      border-color: ${color.base08};
      color: ${color.base00};
    }
  '';
}
