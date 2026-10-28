{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
  icons = "${config.programs.wlogout.package}/share/wlogout/icons";
in
{
  programs.wlogout.style = ''
    * {
      font-family: "${config.stylix.fonts.sansSerif.name}", "${config.stylix.fonts.monospace.name}";
      font-size: 14px;
      font-weight: 600;
      text-shadow: none;
      box-shadow: none;
    }

    window {
      background-color: alpha(${color.base00}, 0.88);
    }

    button {
      background-color: ${color.base01};
      background-repeat: no-repeat;
      background-position: center;
      background-size: 32px;
      border: 1px solid alpha(${color.base04}, 0.24);
      border-radius: 9999px;
      color: ${color.base05};
      min-width: 86px;
      min-height: 86px;
      margin: 0;
      padding: 0;
      outline-style: none;
      transition: background-color 150ms ease, border-color 150ms ease;
    }

    button:hover {
      background-color: ${color.base02};
      border-color: alpha(${color.base0D}, 0.65);
    }

    button:focus {
      background-color: ${color.base02};
      border-color: ${color.base0D};
      box-shadow: inset 0 0 0 1px ${color.base0D};
    }

    button:active {
      background-color: mix(${color.base02}, ${color.base0D}, 0.2);
      border-color: ${color.base0D};
    }

    #lock {
      background-image: url("${icons}/lock.png");
    }

    #logout {
      background-image: url("${icons}/logout.png");
    }

    #suspend {
      background-image: url("${icons}/suspend.png");
    }

    #reboot {
      background-image: url("${icons}/reboot.png");
    }

    #shutdown {
      background-image: url("${icons}/shutdown.png");
      border-color: alpha(${color.base08}, 0.3);
    }

    #shutdown:hover,
    #shutdown:focus {
      background-color: mix(${color.base01}, ${color.base08}, 0.1);
      border-color: ${color.base08};
    }

    #shutdown:focus {
      box-shadow: inset 0 0 0 1px ${color.base08};
    }

    #shutdown:active {
      background-color: mix(${color.base02}, ${color.base08}, 0.2);
    }
  '';
}
