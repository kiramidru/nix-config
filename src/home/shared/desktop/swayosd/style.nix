{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  services.swayosd.stylePath = builtins.toFile "swayosd-style.css" ''
    window#osd {
      border-radius: 32px;
      background: ${color.base00}; 
      border: 1px solid ${color.base02};
    }

    #container {
      margin: 16px;
    }

    label {
      color: ${color.base05};
      font-size: 14px;
    }

    image {
      color: ${color.base05};
      -gtk-icon-transform: scale(0.7);
    }

    progressbar {
      min-height: 5px;
      border-radius: 0px;
    }

    progressbar progress {
      background: ${color.base05};
    }
  '';
}
