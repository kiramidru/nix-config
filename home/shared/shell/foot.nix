{ ... }:
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        pad = "8x8";
        font = "JetBrains Mono:size=10";
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
