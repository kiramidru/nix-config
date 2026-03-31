{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
        show_hidden = true;
      };

      opener = {
        open = [
          {
            run = "xdg-open \"$@\"";
            desc = "System Default";
            orphan = true;
          }
        ];
        extract = [
          {
            run = "ouch decompress \"$@\"";
            desc = "Extract archive";
          }
        ];
        sioyek = [
          {
            run = "sioyek \"$@\"";
            desc = "Sioyek";
            orphan = true;
          }
        ];
      };

      open = {
        rules = [
          {
            mime = "application/pdf";
            use = [ "sioyek" ];
          }
          {
            mime = "application/epub+zip";
            use = [ "sioyek" ];
          }
          {
            mime = "{image,video,audio}/*";
            use = [ "open" ];
          }
          {
            mime = "application/{zip,rar,7z*,tar*}";
            use = [ "extract" ];
          }
          {
            name = "*";
            use = [ "open" ];
          }
        ];
      };
    };
  };

  home.packages = [ pkgs.ouch ];
}
