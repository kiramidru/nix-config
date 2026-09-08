{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  services.swaync.style = ''
    * {
      all: unset;
      font-size: 14px;
      font-family: "Ubuntu Nerd Font";
      transition: 200ms;
    }

    trough highlight {
      background: ${color.base05};
    }

    scale {
      margin: 0 7px;
    }

    scale trough {
      margin: 0rem 1rem;
      min-height: 8px;
      min-width: 70px;
      border-radius: 12.6px;
    }

    trough slider {
      margin: -10px;
      border-radius: 12.6px;
      transition: all 0.2s ease;
      background-color: ${color.base0D};
    }

    trough {
      background-color: ${color.base01};
    }

    /* notifications */

    .notification-background {
      border-radius: 12.6px;
      margin: 18px;
      background: ${color.base01};
      color: ${color.base05};
      padding: 0;
    }

    .notification-background .notification {
      padding: 7px;
      border-radius: 12.6px;
    }

    .notification .notification-content {
      margin: 7px;
    }

    .notification .notification-content overlay {
      /* icons */
      margin: 4px;
    }

    .notification-content .summary {
      color: ${color.base05};
    }

    .notification-content .time {
      color: ${color.base04};
    }

    .notification-content .body {
      color: ${color.base04};
    }

    .notification > *:last-child > * {
      min-height: 3.4em;
    }

    .notification-background .close-button {
      margin: 7px;
      padding: 2px;
      border-radius: 6.3px;
      color: ${color.base00};
      background-color: ${color.base08};
    }

    .notification-background .close-button:hover {
      background-color: ${color.base08};
    }

    .notification-background .close-button:active {
      background-color: ${color.base09};
    }

    .notification .notification-action {
      border-radius: 7px;
      color: ${color.base05};
      margin: 4px;
      padding: 8px;
      font-size: 0.2rem;
    }

    .notification .notification-action {
      background-color: ${color.base01};
    }

    .notification .notification-action:hover {
      background-color: ${color.base02};
    }

    .notification .notification-action:active {
      background-color: ${color.base03};
    }

    .notification.critical progress {
      background-color: ${color.base08};
    }

    .notification.low progress,
    .notification.normal progress {
      background-color: ${color.base0D};
    }

    .notification progress,
    .notification trough,
    .notification progressbar {
      border-radius: 12.6px;
      padding: 3px 0;
    }

    /* control center */

    .control-center {
      border-radius: 12.6px;
      background-color: ${color.base00};
      color: ${color.base05};
      padding: 14px;
    }

    .control-center .notification-background {
      border-radius: 7px;
      margin: 4px 10px;
    }

    .control-center .notification-background .notification {
      border-radius: 7px;
    }

    .control-center .notification-background .notification.low {
      opacity: 0.8;
    }

    .control-center .widget-title > label {
      color: ${color.base05};
      font-size: 1.3em;
    }

    .control-center .widget-title button {
      border-radius: 7px;
      color: ${color.base05};
      background-color: ${color.base01};
      padding: 8px;
    }

    .control-center .widget-title button:hover {
      background-color: ${color.base02};
    }

    .control-center .widget-title button:active {
      background-color: ${color.base03};
    }

    .control-center .notification-group {
      margin-top: 10px;
    }

    .control-center .notification-group:focus .notification-background {
      background-color: ${color.base01};
    }

    scrollbar slider {
      margin: -3px;
      opacity: 0.8;
    }

    scrollbar trough {
      margin: 2px 0;
    }

    /* dnd */

    .widget-dnd {
      margin-top: 5px;
      border-radius: 8px;
      font-size: 1.1rem;
    }

    .widget-dnd > switch {
      font-size: initial;
      border-radius: 8px;
      background: ${color.base01};
    }

    .widget-dnd > switch:checked {
      background: ${color.base0D};
    }

    .widget-dnd > switch slider {
      background: ${color.base02};
      border-radius: 8px;
    }

    .control-center > label {
      color: ${color.base05};
      font-size: 2rem;
    }

    .image {
      padding-right: 0.5rem;
      opacity: 0%;
    }
  '';
}
