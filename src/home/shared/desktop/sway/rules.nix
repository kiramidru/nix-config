_: {
  wayland.windowManager.sway.config.window.commands = [
    {
      command = "opacity set 1";
      criteria = {
        all = true;
      };
    }
    {
      command = "floating enable, resize set 800 600, move position center";
      criteria = {
        title = "^Impala$";
      };
    }
  ];
}
