{ config, ... }:
let
  color = config.lib.stylix.colors;
in
{
  services.wob = {
    enable = true;
    settings = {
      "" = {
        anchor = "bottom";
        margin = 56;
        width = 320;
        height = 32;
        border_size = 1;
        bar_padding = 5;
        timeout = 1000;
      };
      "style.volume".bar_color = color.base05;
      "style.muted".bar_color = color.base03;
      "style.brightness".bar_color = color.base0A;
      "style.microphone".bar_color = color.base0E;
    };
  };
}
