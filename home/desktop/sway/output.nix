{ ... }:
{
  wayland.windowManager.sway.config = {
    output = {
      "eDP-1" = {
        res = "1920x1080@120Hz";
        pos = "1920 0";
      };

      "*" = {
        bg = "~/.config/wallpapers/perfect.jpg fill";
      };
    };
  };
}
