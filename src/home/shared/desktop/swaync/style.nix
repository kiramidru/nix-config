{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  services.swaync.style = ''
    /* SwayNC 0.12 / GTK4. Keep the packaged layout, replace its visual tokens. */
    :root {
      --cc-bg: ${color.base00};
      --noti-bg: ${config.lib.stylix.colors.base01-rgb-r}, ${config.lib.stylix.colors.base01-rgb-g}, ${config.lib.stylix.colors.base01-rgb-b};
      --noti-bg-alpha: 1;
      --noti-bg-darker: ${color.base00};
      --noti-bg-hover: ${color.base02};
      --noti-bg-focus: alpha(${color.base0D}, 0.12);
      --noti-bg-alt: ${color.base00};
      --noti-border-color: alpha(${color.base04}, 0.18);
      --noti-close-bg: ${color.base02};
      --noti-close-bg-hover: ${color.base08};
      --text-color: ${color.base05};
      --text-color-disabled: ${color.base04};
      --bg-selected: ${color.base0D};
      --border: 1px solid var(--noti-border-color);
      --border-radius: 16px;
      --notification-shadow: none;
      --notification-icon-size: 42px;
      --notification-app-icon-size: 18px;
      --notification-group-icon-size: 20px;
      --font-size-body: 13px;
      --font-size-summary: 14px;
      --hover-transition: background 140ms ease, border-color 140ms ease;
      --hover-tranistion: var(--hover-transition);
      --group-collapse-transition: opacity 180ms ease;
      --group-collapse-tranistion: var(--group-collapse-transition);
      --mpris-album-art-icon-size: 64px;
      --mpris-album-art-shadow: none;
      --mpris-album-art-overlay: alpha(${color.base00}, 0.88);
      --mpris-button-hover: alpha(${color.base0D}, 0.18);
      --widget-volume-row-icon-size: 20px;

      font-family: "${config.stylix.fonts.sansSerif.name}", "${config.stylix.fonts.monospace.name}", sans-serif;
      font-size: 13px;
      color: ${color.base05};
    }

    notificationwindow,
    blankwindow,
    .blank-window,
    .floating-notifications {
      background: transparent;
    }

    /* A single quiet surface, inset from the bar and screen edge. */
    .control-center {
      background: ${color.base00};
      border: 1px solid alpha(${color.base04}, 0.24);
      border-radius: 24px;
      padding: 12px;
      box-shadow: 0 6px 20px alpha(#000000, 0.24);
    }

    .control-center .widget {
      margin: 0 4px 12px;
      padding: 12px;
      border-radius: 14px;
    }

    .control-center .widget-title {
      padding: 8px 4px 6px;
      margin-bottom: 14px;
    }

    .widget-title > label {
      color: ${color.base05};
      font-size: 22px;
      font-weight: 700;
      letter-spacing: -0.6px;
    }

    .widget-title > button {
      background: ${color.base02};
      color: ${color.base05};
      border: 1px solid transparent;
      border-radius: 10px;
      box-shadow: none;
      padding: 6px 12px;
      min-height: 20px;
      font-size: 11px;
      font-weight: 600;
    }

    .widget-title > button:hover {
      background: alpha(${color.base08}, 0.15);
      color: ${color.base08};
      border-color: alpha(${color.base08}, 0.3);
    }

    .control-center .widget-dnd {
      background: ${color.base02};
      padding: 12px 14px;
    }

    .widget-dnd label {
      color: ${color.base05};
      font-size: 13px;
      font-weight: 600;
    }

    .widget-dnd switch {
      background: ${color.base00};
      border: 1px solid alpha(${color.base04}, 0.3);
      border-radius: 20px;
      min-width: 42px;
      min-height: 24px;
      padding: 0;
      box-shadow: none;
      transition: background 140ms ease;
    }

    .widget-dnd switch:checked {
      background: ${color.base0D};
      border-color: ${color.base0D};
    }

    .widget-dnd switch slider {
      background: ${color.base04};
      border: none;
      border-radius: 50%;
      min-width: 18px;
      min-height: 18px;
      margin: 3px;
      box-shadow: none;
    }

    .widget-dnd switch:checked slider {
      background: ${color.base00};
    }

    /* Sound stays compact; individual app streams expand on demand. */
    .control-center .widget-volume {
      background: ${color.base01};
      padding: 10px 12px;
    }

    .widget-volume > box > label {
      color: ${color.base0C};
      font-family: "${config.stylix.fonts.monospace.name}";
      font-size: 19px;
      margin-right: 10px;
    }

    .widget-volume button {
      background: transparent;
      color: ${color.base04};
      border: none;
      border-radius: 8px;
      padding: 4px 8px;
      box-shadow: none;
    }

    .widget-volume button:hover {
      background: ${color.base02};
      color: ${color.base05};
    }

    .per-app-volume {
      background: ${color.base00};
      border-radius: 10px;
      margin: 10px 0 0;
      padding: 6px;
    }

    .per-app-volume row {
      padding: 4px;
    }

    scale {
      padding: 8px 0;
      margin: 0 8px;
    }

    scale trough {
      background: ${color.base02};
      border: none;
      border-radius: 8px;
      min-height: 6px;
    }

    scale highlight {
      background: ${color.base0C};
      border: none;
      border-radius: 8px;
      min-height: 6px;
    }

    scale slider {
      background: ${color.base05};
      border: 2px solid ${color.base01};
      border-radius: 50%;
      min-width: 12px;
      min-height: 12px;
      margin: -6px 0;
      box-shadow: none;
    }

    scale slider:hover {
      background: ${color.base0C};
    }

    /* Media appears only while a player has metadata. */
    .control-center .widget-mpris {
      padding: 0;
      background: transparent;
    }

    .widget-mpris .widget-mpris-player {
      margin: 0;
      background: ${color.base01};
      border: 1px solid alpha(${color.base0D}, 0.22);
      border-radius: 16px;
      box-shadow: none;
    }

    .widget-mpris .widget-mpris-player .mpris-overlay {
      padding: 14px;
    }

    .widget-mpris .widget-mpris-player .mpris-overlay .widget-mpris-album-art {
      border-radius: 10px;
      margin-right: 12px;
    }

    .widget-mpris .widget-mpris-player .mpris-overlay .widget-mpris-title {
      color: ${color.base05};
      font-size: 14px;
      font-weight: 700;
    }

    .widget-mpris .widget-mpris-player .mpris-overlay .widget-mpris-subtitle {
      color: ${color.base04};
      font-size: 12px;
    }

    .widget-mpris button {
      color: ${color.base05};
      border: none;
      border-radius: 10px;
      box-shadow: none;
    }

    .widget-mpris > box > button:disabled {
      opacity: 0.3;
    }

    /* Cards share the same layout in the drawer and in popup windows. */
    .notification-row {
      background: transparent;
    }

    .notification-row .notification-background {
      padding: 5px 2px;
    }

    .floating-notifications .notification-row .notification-background {
      padding: 6px 12px;
    }

    .notification-row .notification-background .notification {
      padding: 0;
      border: 1px solid alpha(${color.base04}, 0.2);
      border-radius: 16px;
      background: ${color.base01};
    }

    .floating-notifications .notification-row .notification-background .notification {
      box-shadow: 0 4px 12px alpha(#000000, 0.22);
    }

    .notification-row .notification-background .notification.critical {
      border-color: alpha(${color.base08}, 0.7);
      background: mix(${color.base01}, ${color.base08}, 0.08);
    }

    .notification-row .notification-background .notification .notification-default-action {
      padding: 14px;
    }

    /* A steady minimum keeps collapsed app stacks from clipping two-line bodies. */
    .control-center .notification-content {
      min-height: 64px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .image {
      border-radius: 10px;
      margin: 0 12px 0 0;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .app-icon {
      margin: 0 8px 0 0;
      -gtk-icon-shadow: none;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .summary {
      font-weight: 700;
      margin-bottom: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .time {
      color: ${color.base04};
      font-size: 10px;
      font-weight: 400;
      margin: 0 22px 4px 8px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .body {
      color: mix(${color.base05}, ${color.base04}, 0.35);
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .body-image {
      margin-top: 10px;
      border-radius: 10px;
      background: transparent;
    }

    .close-button {
      min-width: 22px;
      min-height: 22px;
      margin: 8px 8px 0 0;
      color: ${color.base04};
      background: ${color.base02};
    }

    .close-button:hover {
      color: ${color.base00};
      background: ${color.base08};
    }

    .notification-row .notification-background .notification .notification-alt-actions {
      padding: 0 10px 10px;
    }

    .notification-row .notification-background .notification .notification-action {
      margin: 3px;
    }

    .notification-row .notification-background .notification .notification-action > button {
      background: ${color.base02};
      color: ${color.base05};
      border: 1px solid transparent;
      border-radius: 9px;
      padding: 7px 10px;
      box-shadow: none;
      font-size: 12px;
      font-weight: 600;
    }

    .notification-row .notification-background .notification .notification-action > button:hover {
      background: alpha(${color.base0D}, 0.18);
      border-color: alpha(${color.base0D}, 0.3);
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply {
      margin-top: 10px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-entry {
      border-radius: 10px;
      padding: 8px 10px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button {
      border-radius: 10px;
      padding: 8px 12px;
    }

    .notification progressbar trough {
      background: ${color.base02};
      border: none;
      border-radius: 6px;
    }

    .notification progressbar progress {
      background: ${color.base0C};
      border: none;
      border-radius: 6px;
      min-height: 5px;
    }

    .notification.critical progressbar progress {
      background: ${color.base08};
    }

    /* App grouping is useful hierarchy, not another card around the cards. */
    .notification-group {
      margin: 4px 0;
      border-radius: 16px;
    }

    .notification-group .notification-group-headers {
      margin: 6px 8px;
    }

    .notification-group .notification-group-headers .notification-group-header {
      color: ${color.base04};
      font-size: 12px;
      font-weight: 600;
    }

    .notification-group .notification-group-close-button .close-button {
      margin: 6px 8px;
    }

    .notification-group .notification-group-buttons {
      margin: 4px 8px;
    }

    .notification-group .notification-group-buttons button {
      background: ${color.base02};
      color: ${color.base05};
      border: none;
      border-radius: 8px;
      box-shadow: none;
      padding: 4px 8px;
    }

    .control-center .control-center-list-placeholder {
      opacity: 1;
      color: ${color.base04};
      font-size: 14px;
    }

    .control-center-list-placeholder image {
      -gtk-icon-size: 48px;
      margin-bottom: 14px;
      opacity: 0.5;
    }

    /* Low-emphasis, labelled shortcuts anchored below the notification list. */
    .control-center .widget-buttons-grid {
      margin: 10px 2px 0;
      padding: 12px 0 0;
      border-top: 1px solid alpha(${color.base04}, 0.16);
      border-radius: 0;
    }

    .widget-buttons-grid flowboxchild {
      padding: 0 3px;
    }

    .widget-buttons-grid flowboxchild > button {
      background: ${color.base01};
      color: ${color.base05};
      border: 1px solid transparent;
      border-radius: 12px;
      min-height: 38px;
      padding: 2px 8px;
      font-size: 14px;
      box-shadow: none;
    }

    .widget-buttons-grid flowboxchild > button:hover {
      background: ${color.base02};
      border-color: alpha(${color.base0D}, 0.3);
    }

    button:focus-visible,
    switch:focus-visible,
    scale:focus-visible {
      outline: 2px solid ${color.base0D};
      outline-offset: 2px;
    }

    .notification-row:focus-visible .notification,
    .notification-group:focus-visible {
      outline: 2px solid ${color.base0D};
      outline-offset: -2px;
    }

    scrollbar {
      background: transparent;
    }

    scrollbar slider {
      background: alpha(${color.base04}, 0.3);
      border-radius: 8px;
      min-width: 4px;
      min-height: 32px;
    }

    scrollbar slider:hover {
      background: ${color.base04};
    }

    tooltip {
      background: ${color.base02};
      color: ${color.base05};
      border: 1px solid alpha(${color.base04}, 0.25);
      border-radius: 10px;
    }
  '';
}
