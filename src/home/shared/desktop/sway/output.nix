{ inputs, ... }:
{
  wayland.windowManager.sway.config = {
    output = {
      "eDP-1" = {
        res = "1920x1080@120Hz";
        pos = "0 0";
        bg = "${inputs.wallpapers}/view.jpeg fill";
      };
    };
  };
}
