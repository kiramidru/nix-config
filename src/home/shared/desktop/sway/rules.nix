{ ... }:
{
  wayland.windowManager.sway.config.window.commands = [
    {
      command = "opacity set 0.8";
      criteria = {
        class = ".*";
      };
    }
    {
      command = "floating enable, resize set 800 600, move position center";
      criteria = {
        title = "^impala-float$";
      };
    }
  ];
}
