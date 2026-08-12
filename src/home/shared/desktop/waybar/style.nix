{ config, ... }:
let
  color = config.lib.stylix.colors.withHashtag;
in
{
  programs.waybar.style = ''
    * {
      all: unset;
      font-family: "${config.stylix.fonts.monospace.name}", "JetBrainsMono Nerd Font Propo";
      font-size: 98%;
      font-weight: bold;
      font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
      transition: min-width 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }

    window#waybar {
      background-color: transparent;
    }

    #clock,
    #workspaces,
    #window,
    #custom-swaync,
    #battery,
    #custom-power {
      border-radius: 9999px;
      background-color: ${color.base00};
      padding: 10px 16px;
    }

    #workspaces {
      padding: 8px;
    }

    #workspaces button {
      border-radius: 999px;
      min-width: 32px;
    }

    #workspaces button.focused {
      background-color: ${color.base05};
      color: ${color.base00};
      min-width: 56px;
    }

    #window {
      color: ${color.base04};
      font-style: italic;
    }

    window#waybar.empty #window {
      background-color: transparent;
    }

    #controls {
      border-radius: 20px;
      background-color: ${color.base00};
      padding: 8px 12px;
    }

    #custom-swaync,
    #custom-power {
      padding: 6px 14px;
      padding-bottom: 8px;
    }

    tooltip {
      background: ${color.base00};
      border: 1px solid ${color.base02};
    }

    tooltip label {
      color: ${color.base05};
      padding: 4px;
    }
  '';
}
