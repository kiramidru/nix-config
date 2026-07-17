{ ... }:
{
  services.swayosd = {
    enable = true;
    topMargin = 0.95;
    stylePath = builtins.toFile "swayosd-style.css" ''
      window#osd {
        border-radius: 0px;
        background: rgba(30, 30, 46, 0.9);
        border: 1px solid rgba(255, 255, 255, 0.1);
      }

      #container {
        margin: 16px;
      }

      label {
        color: #cdd6f4;
        font-size: 14px;
      }

      image {
        color: #cdd6f4;
        -gtk-icon-transform: scale(0.7);
      }

      progressbar {
        min-height: 5px;
        border-radius: 0px;
      }

      progressbar progress { 
        background: #cdd6f4;
      }
    '';
  };
}
