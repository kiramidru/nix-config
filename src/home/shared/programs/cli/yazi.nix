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
        media = [
          {
            run = "imv -d \"$@\"";
            desc = "Open with swayimg";
            orphan = true;
          }
        ];
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
            use = [
              "media"
              "open"
            ];
          }
          {
            mime = "application/{zip,rar,7z*,tar*}";
            use = [ "extract" ];
          }
          {
            url = "*";
            use = [ "open" ];
          }
        ];
      };
    };
  };

  home.packages = [
    pkgs.imv
    pkgs.ouch
  ];
}
