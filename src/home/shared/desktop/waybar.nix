{ ... }:
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
        font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(15, 23, 42, 1);
        color: #f1f5f9;
      }

      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: #94a3b8;
        border-bottom: 2px solid transparent;
      }

      #workspaces button.focused {
        color: #22d3ee;
        border-bottom: 2px solid #22d3ee;
      }

      #clock, #pulseaudio, #network, #battery, #window {
        padding: 0 8px;
        color: #f1f5f9;
        font-weight: bold;
      }
    '';
  };
}
