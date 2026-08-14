{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings.mainBar = {
      position = "top";
      layer = "top";
      fixed-center = true;
      margin-top = 8;
      margin-left = 8;
      margin-right = 8;
      spacing = 8;

      modules-left = [
        "clock"
        "sway/workspaces"
      ];

      modules-center = [ "sway/window" ];

      modules-right = [
        "custom/swaync"
        "group/controls"
        "battery"
        "custom/power"
      ];

      "clock" = {
        interval = 1;
        format = " {:%I:%M %p}";
        format-alt = " {:%Y, %d %B, %A}";
        tooltip = false;
      };

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
        };

        persistent-workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
        };
      };

      "sway/window" = {
        format = "{title}";
        max-length = 60;
        separate-outputs = true;
        all-outputs = false;
        offscreen-css = true;
        offscreen-css-text = "bold";
        tooltip = false;
      };

      "custom/swaync" = {
        exec = "swaync-client -swb";
        return-type = "json";
        format = "{text} {icon}";
        format-icons = {
          notification = "";
          none = "";
          dnd-notification = "";
          dnd-none = "";
          inhibited-notification = "";
          inhibited-none = "";
          dnd-inhibited-notification = "";
          dnd-inhibited-none = "";
        };
        on-click = "swaync-client -t";
        on-click-right = "swaync-client -d";
      };

      "group/controls" = {
        orientation = "horizontal";
        modules = [
          "pulseaudio"
          "network"
        ];
      };

      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-muted = "󰖁 Muted";
        format-icons = {
          bluetooth = "󰂰";
          default = [
            ""
            ""
            "󰕾"
            ""
          ];
        };
        scroll-step = 5;
        tooltip-format = "{icon} {desc}";
        on-click = "setsid foot -t 'Volume Mixer' -e pulsemixer";
        on-click-right = "pavucontrol -t 3";
      };

      "network" = {
        format = "{icon} {essid}";
        format-ethernet = "󰈀  {ifname}";
        format-disconnected = "󰤮";
        format-icons = {
          default = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };
        interval = 1;
        tooltip-format = "↓ {bandwidthDownBytes}\n↑ {bandwidthUpBytes}";
        on-click = "setsid foot -t 'Impala' -e impala";
      };

      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = "󱘖 {capacity}%";
        format-full = "{icon} Full";
        format-icons = [
          "󰂎"
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
        tooltip-format = "{timeTo} {power}W";
        on-click-right = "wlogout";
      };

      "custom/power" = {
        format = "⏻";
        on-click = "wlogout";
        tooltip = false;
      };
    };
  };
}
