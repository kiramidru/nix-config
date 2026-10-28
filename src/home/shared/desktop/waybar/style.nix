{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  programs.waybar.style = ''
    * {
      all: unset;
      font-family: ${config.stylix.fonts.monospace.name}, "JetBrainsMono Nerd Font Propo";
      font-size: 98%;
      font-weight: bold;
      transition: min-width 0.3s cubic-bezier(.55,-0.68,.48,1.682),
        background-color 150ms ease, color 150ms ease;
    }

    window#waybar {
      background-color: transparent;
    }

    #clock,
    #workspaces,
    #window,
    #custom-swaync,
    #battery,
    #custom-power {
      border-radius: 9999px;
      background-color: ${color.base00};
      color: ${color.base05};
      padding: 10px 16px;
    }

    #workspaces {
      padding: 8px;
    }

    #workspaces button {
      border-radius: 999px;
      color: ${color.base05};
      min-width: 32px;
    }

    #workspaces button:hover {
      background-color: ${color.base02};
      color: ${color.base0D};
    }

    #workspaces button.focused {
      background-color: ${color.base05};
      color: ${color.base00};
      min-width: 56px;
    }

    #workspaces button.focused:hover {
      background-color: ${color.base0D};
      color: ${color.base00};
    }

    #window {
      color: ${color.base04};
      font-style: italic;
    }

    window#waybar.empty #window {
      background-color: transparent;
    }

    #controls {
      border-radius: 20px;
      background-color: ${color.base00};
      padding: 8px 12px;
    }

    #custom-swaync,
    #custom-power {
      padding: 6px 16px 8px 13px;
    }

    #clock:hover,
    #custom-swaync:hover,
    #battery:hover {
      background-color: ${color.base02};
      color: ${color.base0D};
    }

    #controls:hover {
      background-color: ${color.base01};
    }

    #pulseaudio:hover,
    #network:hover {
      color: ${color.base0C};
    }

    #custom-swaync.notification,
    #custom-swaync.inhibited-notification {
      color: ${color.base0D};
    }

    #custom-swaync.dnd-none,
    #custom-swaync.dnd-notification,
    #custom-swaync.dnd-inhibited-none,
    #custom-swaync.dnd-inhibited-notification {
      color: ${color.base0A};
    }

    #custom-power:hover {
      background-color: alpha(${color.base08}, 0.15);
      color: ${color.base08};
    }

    tooltip {
      background: ${color.base00};
      border: 1px solid ${color.base0E};
    }

    tooltip label {
      color: ${color.base05};
      padding: 4px;
    }
  '';
}
