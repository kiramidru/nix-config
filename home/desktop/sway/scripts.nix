{ pkgs, ... }:

let
  notchScript = pkgs.writeShellScriptBin "toggle_notch" ''
    EWW="${pkgs.eww}/bin/eww"
    if [[ "$($EWW get notch_state)" == "$1" ]]; then
        $EWW update notch_state="window"
    else
        $EWW update notch_state="$1"
    fi
  '';
in
{
  home.packages = [ notchScript ];
}
