{ lib, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "Iosevka:size=7";
        icons-enabled = false;

        terminal = "foot";
        prompt = "'󱓞  Apps ❯ '";

        anchor = "center";
        width = 120;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 10;

        line-height = 16;
        fields = "name,generic,exec,categories";
      };

      border = {
        width = lib.mkForce 0;
        radius = lib.mkForce 10;
      };
    };
  };
}
