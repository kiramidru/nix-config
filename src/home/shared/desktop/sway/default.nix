_: {
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;

    config = {
      terminal = "foot";
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      bars = [ ];

      gaps = {
        inner = 4;
        outer = 4;
        smartGaps = false;
      };

      window = {
        border = 0;
        titlebar = false;
      };
    };
  };
}
