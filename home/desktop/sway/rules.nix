{ ... }:
{
  wayland.windowManager.sway.config.window.commands = [
    {
      command = "opacity 0.75, blur enable";
      criteria = {
        app_id = "foot";
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
