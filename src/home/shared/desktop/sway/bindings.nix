{ pkgs, ... }:
let
  mod = "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  term = "foot";
  menu = "fuzzel";
  file = "yazi";

  osdControl = pkgs.writeShellApplication {
    name = "desktop-osd-control";
    runtimeInputs = with pkgs; [
      wireplumber
      brightnessctl
      coreutils
      gawk
    ];
    text = ''
      device=@DEFAULT_AUDIO_SINK@
      style=volume
      case "''${1:-}" in
        volume-up) wpctl set-volume --limit 1.0 "$device" 5%+ ;;
        volume-down) wpctl set-volume "$device" 5%- ;;
        volume-mute) wpctl set-mute "$device" toggle ;;
        mic-mute)
          device=@DEFAULT_AUDIO_SOURCE@
          style=microphone
          wpctl set-mute "$device" toggle
          ;;
        brightness-up|brightness-down)
          step=+5%
          if [[ $1 == brightness-down ]]; then step=5%-; fi
          brightnessctl --class=backlight --min-value=1 set "$step" >/dev/null
          style=brightness
          ;;
        *) echo "Unknown OSD control: ''${1:-}" >&2; exit 2 ;;
      esac

      if [[ $style == brightness ]]; then
        value=$(brightnessctl --class=backlight --machine-readable | awk -F, '{gsub(/%/, "", $4); print $4; exit}')
      else
        volume=$(wpctl get-volume "$device")
        value=$(awk '{v = int($2 * 100 + 0.5); print (v > 100 ? 100 : v)}' <<< "$volume")
        if [[ $volume == *MUTED* ]]; then
          value=0
          style=muted
        fi
      fi

      # Audio/backlight control must still work if the OSD is unavailable.
      # Bound the FIFO write so a missing reader cannot leave a stuck process.
      fifo="''${XDG_RUNTIME_DIR:?}/wob.sock"
      if [[ -p $fifo ]]; then
        printf '%s %s\n' "$value" "$style" | timeout 0.1s tee "$fifo" >/dev/null || true
      fi
    '';
  };
in
{
  wayland.windowManager.sway.config = {
    modifier = mod;
    keybindings = {
      # Basics
      "${mod}+Return" = "exec ${term}";
      "${mod}+c" = "kill";
      "${mod}+space" = "exec ${menu}";
      "${mod}+e" = "exec ${term} ${file}";
      "${mod}+Shift+c" = "reload";

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

      # Media & Hardware (Locked keys work while screen is off/locked)
      "--locked XF86MonBrightnessDown" = "exec ${osdControl}/bin/desktop-osd-control brightness-down";
      "--locked XF86MonBrightnessUp" = "exec ${osdControl}/bin/desktop-osd-control brightness-up";
      "--locked XF86AudioMute" = "exec ${osdControl}/bin/desktop-osd-control volume-mute";
      "--locked XF86AudioLowerVolume" = "exec ${osdControl}/bin/desktop-osd-control volume-down";
      "--locked XF86AudioRaiseVolume" = "exec ${osdControl}/bin/desktop-osd-control volume-up";
      "--locked XF86AudioMicMute" = "exec ${osdControl}/bin/desktop-osd-control mic-mute";
      "--locked XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
      "--locked XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
      "--locked XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";

      # Screenshotting
      "${mod}+Shift+s" =
        "exec grim -g \"$(slurp)\" - | tee \"$HOME/Pictures/Screenshots/screenshot-$(date +'%Y%m%d_%H%M%S').png\" | wl-copy";
      "Print" =
        "exec grim - | tee \"$HOME/Pictures/Screenshots/screenshot-$(date +'%Y%m%d_%H%M%S').png\" | wl-copy";
    };
  };
}
