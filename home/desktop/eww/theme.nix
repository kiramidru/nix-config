{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;

  scss-vars = ''
    $bg_color: ${colors.base00};
    $primary:  ${colors.base0B}; 
    $accent:   ${colors.base0D};
    $disabled: ${colors.base03};
    $fg_color: ${colors.base05};
    $error:    ${colors.base08};
  '';

  colored-assets = pkgs.runCommand "eww-assets" { } ''
    mkdir -p $out
    cp -r ${./assets}/* $out/

    find $out -name "*.svg" -type f -exec sed -i 's/#FF00FF/${colors.base0B}/g' {} +
    find $out -name "*.svg" -type f -exec sed -i 's/#00FFFF/${colors.base0D}/g' {} +
  '';

in
{

  xdg.configFile."eww/theme.scss".text = scss-vars;
  xdg.configFile."eww/assets".source = colored-assets;
}
