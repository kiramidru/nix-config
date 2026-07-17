{ lib, ... }:
let
  mod = "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  term = "foot";
  menu = "fuzzel";
  file = "yazi";
in
{
  wayland.windowManager.sway.config = {
    modifier = mod;
    keybindings = lib.mkOptionDefault {
      # Basics
      "${mod}+Return" = "exec ${term}";
      "${mod}+c" = "kill";
      "${mod}+space" = "exec ${menu}";
      "${mod}+e" = "exec ${term} -e ${file}";
      "${mod}+Shift+c" = "reload";

      #TODO: FIX THIS
      "${mod}+n" = "exec toggle_notch power";

      # Focus Movement (Vim keys)
      "${mod}+${left}" = "focus left";
      "${mod}+${down}" = "focus down";
      "${mod}+${up}" = "focus up";
      "${mod}+${right}" = "focus right";

      # Focus Movement (Arrows)
      "${mod}+Left" = "focus left";
      "${mod}+Down" = "focus down";
      "${mod}+Up" = "focus up";
      "${mod}+Right" = "focus right";

      # Move Windows (Shift + Vim)
      "${mod}+Shift+${left}" = "move left";
      "${mod}+Shift+${down}" = "move down";
      "${mod}+Shift+${up}" = "move up";
      "${mod}+Shift+${right}" = "move right";

      # Workspaces
      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";
      "${mod}+6" = "workspace number 6";
      "${mod}+7" = "workspace number 7";
      "${mod}+8" = "workspace number 8";
      "${mod}+9" = "workspace number 9";
      "${mod}+0" = "workspace number 10";

      # Move to Workspaces
      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";
      "${mod}+Shift+9" = "move container to workspace number 9";
      "${mod}+Shift+0" = "move container to workspace number 10";

      # Layout
      "${mod}+s" = "layout toggle split";
      "${mod}+f" = "fullscreen";
      "${mod}+v" = "floating toggle";
      "${mod}+p" = "toggle-vpn";

      # Media & Hardware (Locked keys work while screen is off/locked)
      "XF86MonBrightnessDown" = "exec swayosd-client --brightness lower";
      "XF86MonBrightnessUp" = "exec swayosd-client --brightness raise";
      "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
      "XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower";
      "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise";
      "XF86AudioMicMute" = "exec swayosd-client --input-volume mute-toggle";
      "XF86AudioPlay" = "exec swayosd-client --playerctl play-pause";
      "XF86AudioNext" = "exec swayosd-client --playerctl next";
      "XF86AudioPrev" = "exec swayosd-client --playerctl prev";

      "Print" = "exec grim";
    };
  };
}
