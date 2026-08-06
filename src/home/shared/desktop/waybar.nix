{ config, ... }:

let
  color = config.lib.stylix.colors.withHashtag;
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 4;

        modules-left = [
          "sway/workspaces"
          "sway/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "network"
          "battery"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
            "default" = "{name}";
          };
        };

        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y}";
          tooltip-format = "{:%A, %B %d, %Y}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "setsid foot -t 'Volume Mixer' -e pulsemixer";
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈀  {ifname}";
          format-disconnected = "󰤮";
          tooltip-format = "{ifname} via {gwaddr}";
          on-click = "setsid foot -t 'Impala' -e impala";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "sway/window" = {
          format = "{title}";
          max-length = 50;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "${config.stylix.fonts.monospace.name}", "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: ${color.base00};
        color: ${color.base05};
        border-bottom: 1px solid ${color.base01};
      }

      #workspaces button {
        padding: 0 8px;
        background: transparent;
        color: ${color.base04};
        border-bottom: 2px solid transparent;
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: ${color.base0E};
        border-bottom: 2px solid ${color.base0E};
        background-color: ${color.base01};
      }

      #workspaces button:hover {
        background: ${color.base02};
        color: ${color.base05};
      }

      #window {
        color: ${color.base04};
        font-style: italic;
      }

      #clock {
        color: ${color.base0F};
        font-weight: bold;
      }

      #pulseaudio {
        color: ${color.base0D};
        font-weight: bold;
      }

      #network {
        color: ${color.base0C};
        font-weight: bold;
      }

      #battery {
        color: ${color.base0B};
        font-weight: bold;
      }

      #battery.warning {
        color: ${color.base0A};
      }

      #battery.critical {
        color: ${color.base08};
      }

      #clock, #pulseaudio, #network, #battery, #window {
        padding: 0 8px;
      }
    '';
  };
}
