{ ... }:
{
  wayland.windowManager.sway.config = {
    input = {
      "type:touchpad" = {
        drag_lock = "disabled";
        dwt = "enabled";
        tap = "enabled";
        natural_scroll = "enabled";
        middle_emulation = "enabled";
        pointer_accel = "0.3";
      };

      "type:keyboard" = {
        xkb_layout = "us";
      };
    };

    focus = {
      followMouse = "always";
    };
  };
}
