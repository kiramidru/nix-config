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
            run = "imv -d %s";
            desc = "Open with swayimg";
            orphan = true;
          }
        ];
        open = [
          {
            run = "xdg-open %s";
            desc = "System Default";
            orphan = true;
          }
        ];
        extract = [
          {
            run = "ouch decompress %s";
            desc = "Extract archive";
          }
        ];
        sioyek = [
          {
            run = "sioyek %s";
            desc = "Sioyek";
            orphan = true;
          }
        ];
      };

      open = {
        rules = [
          {
            mime = "application/pdf";
            use = "sioyek";
          }
          {
            mime = "application/epub+zip";
            use = "sioyek";
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
            use = "extract";
          }
          {
            url = "*";
            use = "open";
          }
        ];
      };
    };
  };

  home.packages = with pkgs; [
    imv
    mpv
    ouch
    sioyek
  ];
}
