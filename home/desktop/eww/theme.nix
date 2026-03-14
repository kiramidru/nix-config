{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;

  # 1. SCSS Theme Variables
  scss-vars = ''
    $bg_color: ${colors.base00};
    $primary:  ${colors.base0B}; 
    $accent:   ${colors.base0D};
    $disabled: ${colors.base03};
    $fg_color: ${colors.base05};
    $error:    ${colors.base08};
  '';

  # 2. SVG Color Substitution
  # This creates a colored version of your assets folder
  colored-assets = pkgs.runCommand "eww-assets" { } ''
    mkdir -p $out
    cp -r ${./assets}/* $out/
    # Replace #FF00FF with Stylix Primary, and #00FFFF with Stylix Accent
    find $out -name "*.svg" -type f -exec sed -i 's/#FF00FF/${colors.base0B}/g' {} +
    find $out -name "*.svg" -type f -exec sed -i 's/#00FFFF/${colors.base0D}/g' {} +
  '';

in
{
  # Write the SCSS variables
  xdg.configFile."eww/theme.scss".text = scss-vars;

  # Symlink the processed assets into your eww config
  # This makes them available at ~/.config/eww/assets/
  xdg.configFile."eww/assets".source = colored-assets;
}
