{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "Lock (l)";
        keybind = "l";
      }
      {
        label = "logout";
        action = "swaymsg exit";
        text = "Logout (e)";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend (u)";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot (r)";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown (s)";
        keybind = "s";
      }
    ];

    style = ''
      * {
        background-image: none;
        font-family: "${config.stylix.fonts.monospace.name}", sans-serif;
        font-size: 16px;
        box-shadow: none;
      }

      window {
        background-color: rgba(0, 0, 0, 0.7); /* Darkened backdrop */
      }

      button {
        border-radius: 8px;
        border: 2px solid ${color.base02};
        color: ${color.base05};
        background-color: ${color.base01};
        margin: 10px;
        transition: all 0.2s ease-in-out;
      }

      button:focus,
      button:hover {
        border-color: ${color.base0E};
        color: ${color.base0E};
        background-color: ${color.base02};
      }

      #shutdown { color: ${color.base08}; }
      #reboot   { color: ${color.base09}; }
      #suspend  { color: ${color.base0A}; }
      #logout   { color: ${color.base0D}; }
      #lock     { color: ${color.base0B}; }
    '';
  };
}
