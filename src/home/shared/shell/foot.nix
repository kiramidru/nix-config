_: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=10";
        pad = "8x8";
      };

      scrollback = {
        lines = 10000;
      };

      "key-bindings" = {
        scrollback-up-page = "Shift+Page_Up";
        scrollback-down-page = "Shift+Page_Down";
      };
    };
  };
}
