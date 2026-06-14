{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.blender
    godot_4
    inkscape
    gimp
  ];
}
