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
        play = [
          {
            run = "mpv %s";
            desc = "Open with mpv";
            orphan = true;
          }
        ];
        media = [
          {
            run = "imv -d %s";
            desc = "Open with imv";
            orphan = true;
          }
        ];
        sioyek = [
          {
            run = "sioyek %s";
            desc = "Sioyek";
            orphan = true;
          }
        ];
        open = [
          {
            run = "xdg-open %s1";
            desc = "System Default";
            orphan = true;
          }
        ];
        extract = [
          {
            run = "ouch decompress -y %s";
            desc = "Extract archive";
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
            mime = "image/*";
            use = [
              "media"
              "open"
            ];
          }
          {
            mime = "{video,audio}/*";
            use = [
              "play"
              "open"
            ];
          }
          {
            mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
            use = "extract";
          }
          {
            url = "*.{zip,rar,7z,tar,tar.gz,tgz,tar.xz,txz,tar.zst,tzst,tar.bz2,tbz2,gz,bz2,xz,zst}";
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
